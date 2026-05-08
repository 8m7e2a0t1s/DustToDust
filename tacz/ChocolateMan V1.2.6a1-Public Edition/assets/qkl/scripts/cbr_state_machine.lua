-- 脚本的位置是 "{命名空间}:{路径}"，那么 require 的格式为 "{命名空间}_{路径}"
-- 注意！require 取得的内容不应该被修改，应仅调用
local default = require("qkl_machinegun_state_machine")
local GUN_KICK_TRACK_LINE = default.GUN_KICK_TRACK_LINE
local STATIC_TRACK_LINE = default.STATIC_TRACK_LINE
local BOLT_CAUGHT_TRACK = default.BOLT_CAUGHT_TRACK
local MAIN_TRACK = default.MAIN_TRACK
local main_track_states = default.main_track_states
local bolt_caught_states = default.bolt_caught_states
-- main_track_states.idle 是我们要重写的状态。
local idle_state = setmetatable({}, {__index = main_track_states.idle})

local gun_kick_state = setmetatable({}, {__index = default.gun_kick_state})

local normal = setmetatable({}, {__index = bolt_caught_states.normal})
local bolt_caught = setmetatable({}, {__index = bolt_caught_states.bolt_caught})

-- reload_state、bolt_state 是定义的新状态，用于执行单发装填
local reload_state = {
    need_ammo = 0,
    loaded_ammo = 0,
    emptyload = 0
}

local function isNoAmmo(context)
    return (not context:hasBulletInBarrel()) and (context:getAmmoCount() <= 0)
end

function normal.update(this, context)
    if (not context:hasBulletInBarrel()) then
        context:trigger(this.INPUT_BOLT_CAUGHT)
    end
end

function bolt_caught.update(this, context)
    if (context:hasBulletInBarrel()) then
        context:trigger(this.INPUT_BOLT_NORMAL)
    end
end

function gun_kick_state.transition(this, context, input)
    if (input == INPUT_SHOOT) then
        local track = context:findIdleTrack(GUN_KICK_TRACK_LINE, false)
            if(context:getAttachment("SCOPE") ~= "tacz:empty") then
                context:runAnimation("shoot_scope", track, true, PLAY_ONCE_STOP, 0)
            else
                context:runAnimation("shoot", track, true, PLAY_ONCE_STOP, 0)
            end
        end
    return nil
end

-- 重写 idle 状态的 transition 函数，将输入 INPUT_RELOAD 重定向到新定义的 reload_state 状态
function idle_state.transition(this, context, input)
    if (input == INPUT_RELOAD) then
        return this.main_track_states.reload
    end
    if (input == INPUT_BOLT) then
        if (context:getAttachment("SCOPE") ~= "tacz:empty") then
            context:runAnimation("bolt_scope", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_STOP, 0.2)
        else
            context:runAnimation("bolt", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_STOP, 0.2)
        end
        context:runAnimation("bolt_charge", context:getTrack(STATIC_TRACK_LINE, BOLT_CAUGHT_TRACK), false, PLAY_ONCE_STOP, 0.2)
        return this.main_track_states.idle
    end
    return main_track_states.idle.transition(this, context, input)
end

function reload_state.entry(this, context)
    if (isNoAmmo(context)) then
        this.main_track_states.reload.emptyload = 1
        context:runAnimation("reload_start_clip", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_HOLD, 0.2)
    elseif(context:getAmmoCount() == 0) then
        context:runAnimation("reload_start_1round", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_HOLD, 0.2)
    else
        context:runAnimation("reload_start", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_HOLD, 0.2)
    end
    this.main_track_states.reload.need_ammo = context:getMaxAmmoCount() - context:getAmmoCount()
    this.main_track_states.reload.loaded_ammo = 0
    if(context:hasBulletInBarrel())then
        this.main_track_states.reload.loaded_ammo = this.main_track_states.reload.loaded_ammo + 1
    end
end

function reload_state.update(this, context)
    if (this.main_track_states.reload.loaded_ammo > this.main_track_states.reload.need_ammo or not context:hasAmmoToConsume()) then
        context:trigger(this.INPUT_RELOAD_RETREAT)
    else
        local track = context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK)
        -- 等待 intro 结束，然后循环播放 loop 动画
        if(context:isHolding(track)) then
            if(this.main_track_states.reload.emptyload == 1) then
                if (this.main_track_states.reload.loaded_ammo ~= 5) then
                    context:runAnimation("reload_load_clip", track, false, PLAY_ONCE_HOLD, 0.2)
                end
                this.main_track_states.reload.loaded_ammo = this.main_track_states.reload.loaded_ammo + 5
            else
                if (isNoAmmo(context)) then
                    context:runAnimation("reload_loop_1round", track, false, PLAY_ONCE_HOLD, 0.2)
                else
                    context:runAnimation("reload_loop", track, false, PLAY_ONCE_HOLD, 0.2)
                end
                this.main_track_states.reload.loaded_ammo = this.main_track_states.reload.loaded_ammo + 1
            end
        end
    end
end

function reload_state.transition(this, context, input)
    if (input == this.INPUT_RELOAD_RETREAT or input == INPUT_CANCEL_RELOAD) then
        if(this.main_track_states.reload.emptyload == 1) then
            context:runAnimation("reload_end_clip", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_STOP, 0.2)
            this.main_track_states.reload.emptyload = 0
        else
            context:runAnimation("reload_end", context:getTrack(STATIC_TRACK_LINE, MAIN_TRACK), false, PLAY_ONCE_STOP, 0.2)
        end
        return this.main_track_states.idle
    end
    return this.main_track_states.idle.transition(this, context, input)
end

-- 用元表的方式继承默认状态机的属性
local M = setmetatable({
    main_track_states = setmetatable({
        -- 自定义的 idle 状态需要覆盖掉父级状态机的对应状态，新建的 reload 状态也要加进来
        idle = idle_state,
        reload = reload_state
    }, {__index = main_track_states}),
    bolt_caught_states = setmetatable({
        normal = normal,
        bolt_caught = bolt_caught
    }, {__index = bolt_caught_states}),
    INPUT_RELOAD_RETREAT = "reload_retreat",
    gun_kick_state = gun_kick_state
}, {__index = default})
-- 先调用父级状态机的初始化函数，然后进行自己的初始化
function M:initialize(context)
    default.initialize(self, context)
    self.main_track_states.reload.need_ammo = 0
    self.main_track_states.reload.loaded_ammo = 0
end
-- 导出状态机
return M
local M = {}

-- 尝试开火射击时调用
function M.shoot(api)
    -- 先从data文件中获取开火延迟数据，由于以毫秒为单位，因此将秒乘以1000转为毫秒
    local shoot_delay = api:getScriptParams().shoot_delay * 1000
    -- 将执行射击的部分委托为一次性的延时任务，从而达到延迟开火的目的
    api:safeAsyncTask(function ()
        api:shootOnce(api:isShootingNeedConsumeAmmo())
        return false
    end,shoot_delay,0,1)
end

return M
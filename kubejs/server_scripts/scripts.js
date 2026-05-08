ServerEvents.recipes(event => {

event.shapeless(
  Item.of('dfc:metal/ingot/alumina', 1), 
  [
    'tfc_metallurgy:metal/ingot/aluminum'
  ]
),
event.shapeless(
  Item.of('dfc:ore/small_bauxite', 1), 
  [
    'tfc_metallurgy:ore/small_bauxite'
  ]
),
    event.shapeless(
  Item.of('dfc:ore/poor_bauxite', 1), 
  [
    'tfc_metallurgy:ore/poor_bauxite'
  ]
),
    event.shapeless(
  Item.of('dfc:ore/normal_bauxite', 1), 
  [
    'tfc_metallurgy:ore/normal_bauxite'
  ]
),
    event.shapeless(
  Item.of('dfc:ore/rich_bauxite', 1), 
  [
    'tfc_metallurgy:ore/rich_bauxite'
  ]
),
    event.shapeless(
  Item.of('xercapaint:item_palette', 1), 
  [
    'tfc_items:short_wooden_handle',
	'firmalife:plate'
  ]
),
event.shaped(
 Item.of('immersive_melodies:trumpet', 1),
 [
'AAA',
'BCB',
' D '
 ],
 {
A:'tfc_items:brass_rivet',
B:'tfc_items:brass_ring',
C:'tfc:metal/sheet/brass',
D:'tfc:metal/rod/brass',
 
}),
event.shaped(
 Item.of('immersive_melodies:bagpipe', 1),
 [
' BC',
'DED',
' D '
 ],
 {
 
B:'tfc:stick_bunch',
C:'tfc_items:leather_strap',
D:'tfc_items:leather_sheet',
E:'waterflasks:bladder',
 
}),
event.shaped(
 Item.of('immersive_melodies:didgeridoo', 1),
 [
'  C',
'DE ',
'GH '
 ],
 {
 
 
C:'minecraft:bamboo',
D:'firmalife:beeswax',
E:'minecraft:bamboo',
G:'minecraft:bamboo',
H:'firmalife:beeswax',
 
}),
event.shaped(
 Item.of('immersive_melodies:triangle', 1),
 [
' A ',
'A A',
'   '
 ],
 {
 
A:'tfc_metallurgy:metal/rod/florentine_bronze',
}),
event.shaped(
 Item.of('immersive_melodies:vielle', 1),
 [
' AB',
'ACA',
' A '
 ],
 {
 
A:'firmalife:treated_lumber',
B:'tfc_items:short_wooden_handle',
C:'minecraft:string',
 
}),
event.shaped(
 Item.of('immersive_melodies:lute', 1),
 [
'  A',
'BA ',
'CB '
 ],
 {
 
 
A:'tfc_items:short_wooden_handle',
B:'firmalife:treated_lumber',
C:'minecraft:string',
 
}),
event.shaped(
 Item.of('immersive_melodies:piano', 1),
 [
'AAA',
'BCB',
'DDD'
 ],
 {
A:'tfc_items:bronze_stamen',
B:'tfc_items:bronze_wire',
C:'tfc_items:cast_iron_heavy_sheet',
D:'firmalife:treated_wood',
}),
event.shaped(
 Item.of('immersive_melodies:handpan', 1),
 [
' A ',
'B B',
'   '
 ],
 {
 
A:'tfc_items:bronze_heavy_sheet',
B:'tfc:metal/sheet/bronze',
}),
event.shaped(
 Item.of('immersive_melodies:tiny_drum', 1),
 [
' A ',
' B ',
'   '
 ],
 {
 
A:'tfc:large_prepared_hide',
B:'#tfc:barrels', 
}),
event.shaped(
 Item.of('immersive_melodies:flute', 1),
 [
'   ',
'AAB',
'   '
 ],
 {
A:'minecraft:bamboo',
B:'tfc_items:saw_wooden_handle',
}),
event.shaped(
 Item.of('immersiveengineering:rs_engineering', 1),
 [
'ABA',
'BCB',
'ABA'
 ],
 {
A:'immersiveengineering:sheetmetal_iron',
B:'minecraft:redstone',
C:'tfc_items:red_steel_gear',
}),
event.shaped(
Item.of('immersiveengineering:hammer', '{Damage:0,multiblockInterdiction:["immersiveengineering:multiblocks/excavator"]}'),
 [
' A ',
' B ',
'   '
 ],
 {
A:'tfc_ie_addon:tool_head/ie_hammer',
B:'minecraft:stick',
}),
event.shaped(
  Item.of('manyideas_core:redstone_key', 1),
  [
    'A  ',
    ' B ',
    '  C'
  ],
  {
    A: 'tfc_items:wrought_iron_ring',
    B: '#forge:rods/wrought_iron',
    C: 'minecraft:redstone' 
  }
),
event.shaped(
  Item.of('manyideas_doors:door_special_portcullis', 1),
  [
    'A  ',
    'A  ',
    '   '
  ],
  {
    A: 'tfc:metal/bars/steel',
  }
),
event.shaped(
  Item.of('manyideas_doors:big_door_portcullis', 1),
  [
    'AAA',
    'AAA',
    'AAA'
  ],
  {
    A: 'tfc:metal/bars/steel',
  }
),
event.shaped(
  Item.of('manyideas_doors:big_door_pipe', 1),
  [
    'ABA',
    'BBB',
    'ABA'
  ],
  {
  A: '#forge:rivets/copper',
  B: 'firmalife:copper_pipe'
  }
),
event.shaped(
  Item.of('manyideas_doors:big_door_factory', 1),
  [
    'AAA',
    'BBB',
    'BBB'
  ],
  {
  A: 'tfc:metal/bars/steel',
  B: 'tfc:metal/sheet/steel'
  }
),
event.shaped(
  Item.of('manyideas_doors:big_door_ship', 1),
  [
    'ABA',
    'BCB',
    'ABA'
  ],
  {
  A: '#forge:rivets/copper',
  B: '#tfc:lumber',
  C: '#forge:rivets/handful/copper'
  }
),
event.shaped(
  Item.of('minecraft:bucket', 1),
  [
    '   ',
    'ABC',
    '   '
  ],
  {
    A: 'tfc:metal/bucket/red_steel',
    B: 'tfc:glue',
    C: 'tfc:metal/bucket/blue_steel'
  }
),
event.shaped(
  Item.of('alekiships:oar', 1),
  [
    'A  ',
    ' B ',
    '  C'
  ],
  {
    A: '#forge:handle/short',
    B: '#forge:handle/long',
    C: '#tfc:lumber'
  }
), 
event.recipes.tfc.quern('minecraft:green_dye', 'minecraft:cactus'),
event.shaped(
  Item.of('shoppy:bartering_station', 1),
  [
    'ABA',
    'CDC',
    'EFE'
  ],
  {
    A: '#lithiccoins:blank_coins',
    B: '#forge:glass',
    C: '#tfc:high_quality_cloth',
    D: '#forge:chests/wooden',
    E: '#minecraft:logs',
    F: '#forge:stone_bricks'
  }
)

})
ServerEvents.tags('item', event => {
event.add('tfc:blast_furnace_fuel', 'immersiveengineering:coal_coke')
	

})
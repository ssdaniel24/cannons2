--++++++++++++++++++++++++++++++++++++
--+ Craft Items                      +
--++++++++++++++++++++++++++++++++++++

minetest.register_craftitem("cannons:gunpowder", {
	groups = {gunpowder=1},
	description = "Gunpowder",
	inventory_image = "cannons_gunpowder.png"
})
cannons.register_gunpowder("cannons:gunpowder");

minetest.register_craftitem("cannons:salt", {
	description = "Salt",
	inventory_image = "cannons_salt.png"
})

minetest.register_craftitem("cannons:bucket_salt", {
	description = "Bucket with salt",
	inventory_image = "cannons_bucket_salt.png",
	stack_max = 300
})


--++++++++++++++++++++++++++++++++++++
--+ crafts                           +
--++++++++++++++++++++++++++++++++++++

minetest.register_craft({
    type = "shapeless",
	output = 'cannons:salt 12',
	recipe = {
		"cannons:bucket_salt"
	},
	replacements = {
		{"cannons:bucket_salt", "bucket:bucket_empty"}
	}
})

minetest.register_craft({
	type = "cooking",
	output = 'cannons:bucket_salt',
	recipe = 'bucket:bucket_water',
	cooktime = 15
})

minetest.register_craft({
	type = "shapeless",
	output = 'cannons:gunpowder',
	recipe = {
		"default:coal_lump", "default:mese_crystal", "cannons:salt"
	},
})


-- new crafts --

minetest.register_craft({
	output = 'cannons:ball_wood 5',
	recipe = {
		{"","default:wood",""},
		{"default:wood","default:wood","default:wood"},
		{"","default:wood",""},
	},
})

minetest.register_craft({
	output = 'cannons:ball_stone',
	recipe = {
		{"default:stone"},
	},
})

minetest.register_craft({
	output = 'cannons:ball_steel 2',
	recipe = {
		{"", "default:steel_ingot",""},
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"", "default:steel_ingot",""},
	},
})

if minetest.settings:get_bool("cannons_enable_explosion") then
minetest.register_craft({
	output = 'cannons:ball_exploding 2',
	recipe = {
		{"","default:mese",""},
		{"default:mese","cannons:gunpowder","default:mese"},
		{"","default:mese",""},
	},
})
end

if minetest.settings:get_bool("cannons_enable_fire") then
minetest.register_craft({
	output = 'cannons:ball_fire 2',
	recipe = {
		{"","default:wood",""},
		{"default:wood","default:torch","default:wood"},
		{"","default:wood",""},
	},
})
end
--++++++++++++++++++++++++++++++++++++
--+ cannon stuff                     +
--++++++++++++++++++++++++++++++++++++

cannons.register_cannon("cannons:cannon_steel", {
	desc = "steel cannon",
	tiles = {"cannons_steel_top.png","cannons_steel_side.png"},
	recipe = {
		{"default:steelblock", "default:steelblock", "default:steelblock"},
		{"cannons:gunpowder", "default:mese_block", ""},
		{"default:steelblock", "default:steelblock", "default:steelblock"}
	},
})

cannons.register_cannon("cannons:cannon_bronze", {
	desc = "bronze cannon",
	tiles = {"cannons_bronze_top.png","cannons_bronze_side.png"},
	recipe = {
		{"default:bronzeblock", "default:bronzeblock", "default:bronzeblock"},
		{"cannons:gunpowder", "default:mese_block", ""},
		{"default:bronzeblock", "default:bronzeblock", "default:bronzeblock"}
	},
})


cannons.register_stand("cannons:wood_stand", {
	desc = "Wooden cannon stand",
	tiles = {"default_wood.png^cannons_rim.png","default_wood.png"},
	mesh = "cannonstand.obj",
	recipe = {
		{"default:wood", "", "default:wood"},
		{"default:wood", "default:steelblock", "default:wood"},
		{"default:wood", "default:wood", "default:wood"}
	},
})

cannons.register_stand("cannons:ship_stand", {
	desc = "Wooden cannon ship stand",
	tiles = {"cannons_steel_top.png","default_wood.png","default_wood.png^cannons_rim.png"},
	mesh = "ship_cannonstand.obj",
})


cannons.register_cannon_with_stand("cannons:wood_stand_with_cannon_steel", {
	desc = "Stand with steel cannon",
	stand = "cannons:wood_stand",
	cannon = "cannons:cannon_steel",
	tiles = {"cannons_steel_top.png","cannons_steel_side.png","default_wood.png","default_wood.png^cannons_rim.png","cannons_steel_top.png"},
	mesh = "cannonstand_cannon.obj",
})

cannons.register_cannon_with_stand("cannons:wood_stand_with_cannon_bronze", {
	desc = "Stand with bronze cannon",
	stand = "cannons:wood_stand",
	cannon = "cannons:cannon_bronze",
	tiles = {"cannons_bronze_top.png","cannons_bronze_side.png","default_wood.png","default_wood.png^cannons_rim.png","cannons_steel_top.png"},
	mesh = "cannonstand_cannon.obj",
})

cannons.register_cannon_with_stand("cannons:ship_stand_with_cannon_steel", {
	desc = "Ship stand with steel cannon",
	stand = "cannons:ship_stand",
	cannon = "cannons:cannon_steel",
	tiles = {"cannons_steel_top.png","cannons_steel_side.png","cannons_steel_top.png","default_wood.png","default_wood.png^cannons_rim.png"},
	mesh = "ship_cannonstand_cannon.obj",
})

cannons.register_cannon_with_stand("cannons:ship_stand_with_cannon_bronze", {
	desc = "Ship stand with bronze cannon",
	stand = "cannons:ship_stand",
	cannon = "cannons:cannon_bronze",
	tiles = {"cannons_bronze_top.png","cannons_bronze_side.png","cannons_steel_top.png","default_wood.png","default_wood.png^cannons_rim.png"},
	mesh = "ship_cannonstand_cannon.obj",
})

--++++++++++++++++++++++++++++++++++++
--+ cannon balls                     +
--++++++++++++++++++++++++++++++++++++

--wood ball
cannons.generate_and_register_ball_node("cannons:ball_wood", {
	description = "Cannon Ball Wood",
	stack_max = 99,
	tiles = {"default_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_wood_defaults(),
	node_box = cannons.nodeboxes.ball,
})

--stone ball
cannons.generate_and_register_ball_node("cannons:ball_stone", {
	description = "Cannon Ball Stone",
	stack_max = 99,
	tiles = {"default_stone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	node_box = cannons.nodeboxes.ball,
})

--steel ball
cannons.generate_and_register_ball_node("cannons:ball_steel", {
	description = "Cannon Ball Steel",
	stack_max = 99,
	tiles = {"cannons_steel_top.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	--diggable = false,
	sounds = cannons.sound_defaults(),
})

--explosion cannon ball
if minetest.settings:get_bool("cannons_enable_explosion") then
cannons.generate_and_register_ball_node("cannons:ball_exploding", {
	description = "Exploding Cannon Ball",
	stack_max = 99,
	tiles = {"default_mese_block.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_wood_defaults(),
})
end

--fire cannon ball
if minetest.settings:get_bool("cannons_enable_fire")  then
cannons.generate_and_register_ball_node("cannons:ball_fire", {
	description = "Burning Cannon Ball",
	stack_max = 99,
	tiles = {"default_tree.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_wood_defaults(),
	node_box = cannons.nodeboxes.ball,
})
end	


--++++++++++++++++++++++++++++++++++++
--+ Meseball                         +
--++++++++++++++++++++++++++++++++++++

local exploding={
	visual = "cube",
	textures = { "default_mese_block.png", "default_mese_block.png", "default_mese_block.png", "default_mese_block.png", "default_mese_block.png", "default_mese_block.png", },
	damage = 15,
	range = 1,
	gravity = 10,
	velocity = 30,
	on_node_hit = function(self,pos,node)
		cannons.nodehitparticles(pos,node)
		cannons.destroy({x=pos.x, y=pos.y, z=pos.z},self.range)
		minetest.sound_play("cannons_shot",
			{pos = pos, gain = 1.0, max_hear_distance = 32,})
		self.object:remove()
	end,

}

if minetest.settings:get_bool("cannons_enable_explosion") then
	cannons.register_muni("cannons:ball_exploding_stack_1",exploding)
end
local fire={
	visual = "cube",
	textures = {"default_tree.png", "default_tree.png", "default_tree.png", "default_tree.png", "default_tree.png", "default_tree.png", },
	damage=10,
	range=2,
	gravity=8,
	velocity=35,
	on_mob_hit = function(self,pos,mob)
		self.object:remove()
	end,
	on_node_hit = function(self,pos,node)
		cannons.nodehitparticles(pos,node)
		pos = self.lastpos
		minetest.env:set_node({x=pos.x, y=pos.y, z=pos.z},{name="fire:basic_flame"})
		minetest.sound_play("default_break_glass",
			{pos = pos, gain = 1.0, max_hear_distance = 32,})
		self.object:remove()
	end,

}
if minetest.settings:get_bool("cannons_enable_fire") then
	cannons.register_muni("cannons:ball_fire_stack_1",fire)
end

--++++++++++++++++++++++++++++++++++++
--+ Wooden Cannon ball                +
--++++++++++++++++++++++++++++++++++++

cannons.register_muni("cannons:ball_wood_stack_1",{
	textures = {"cannons_wood_bullet.png"},
	damage=20,
	range=1,
	gravity=10,
	velocity=40,
})

--++++++++++++++++++++++++++++++++++++
--+ Stone Cannon ball                +
--++++++++++++++++++++++++++++++++++++

cannons.register_muni("cannons:ball_stone_stack_1",{
	textures = {"cannons_bullet.png"},
	damage=20,
	range=2,
	gravity=10,
	velocity=40,
})

--++++++++++++++++++++++++++++++++++++
--+ Steel Cannon ball                +
--++++++++++++++++++++++++++++++++++++

cannons.register_muni("cannons:ball_steel_stack_1",{
	textures = {"cannons_bullet_iron.png"},
	damage=30,
	range=2,
	gravity=5,
	velocity=50,
})

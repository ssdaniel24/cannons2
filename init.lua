cannons = {}
cannons.MODPATH = minetest.get_modpath(minetest.get_current_modname())

dofile(cannons.MODPATH .."/functions.lua")
dofile(cannons.MODPATH .."/items.lua")
dofile(cannons.MODPATH .."/cannonballs.lua")

if minetest.get_modpath("tnt") then
	minetest.log("info","TNT mod is aviable. registering some TNT stuff")
	dofile(cannons.MODPATH .."/tnt.lua")
end

minetest.log("info", "[MOD]"..minetest.get_current_modname().." -- loaded from "..minetest.get_modpath(minetest.get_current_modname()))

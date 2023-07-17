-- wing
if not minetest.settings:get_bool('ju52_hydro.disable_craftitems') then
    minetest.register_craftitem("ju52_hydro:floaters",{
	    description = "Ju52 floaters",
	    inventory_image = "ju52_floaters.png",
    })
end
-- ju52
minetest.register_craftitem("ju52_hydro:ju52", {
	description = "Ju 52 Hydro",
	inventory_image = "ju52_hydro.png",
    liquids_pointable = true,

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
        
        local pointed_pos = pointed_thing.under
        --local node_below = minetest.get_node(pointed_pos).name
        --local nodedef = minetest.registered_nodes[node_below]
        
		pointed_pos.y=pointed_pos.y+4.0
		local new_ju52 = minetest.add_entity(pointed_pos, "ju52_hydro:ju52")
		if new_ju52 and placer then
            local ent = new_ju52:get_luaentity()
            local owner = placer:get_player_name()
            ent.owner = owner
			new_ju52:set_yaw(placer:get_look_horizontal())
			itemstack:take_item()
            ent.object:set_acceleration({x=0,y=airutils.gravity,z=0})
            airutils.create_inventory(ent, ent._trunk_slots, owner)
		end

		return itemstack
	end,
})

--
-- crafting
--
if not minetest.settings:get_bool('ju52.disable_craftitems') and minetest.get_modpath("default") then
	--[[minetest.register_craft({
		output = "ju52:wings",
		recipe = {
			{"wool:white", "farming:string", "wool:white"},
			{"group:wood", "group:wood", "group:wood"},
			{"wool:white", "farming:string", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "ju52:body",
		recipe = {
			{"default:steel_ingot", "default:mese_block", "default:steel_ingot"},
			{"group:wood", "group:wood", "group:wood"},
			{"default:steel_ingot", "group:wood",   "default:steel_ingot"},
		}
	})
	minetest.register_craft({
		output = "ju52:ju52",
		recipe = {
			{"ju52:wings",},
			{"ju52:body",},
		}
	})]]--
end

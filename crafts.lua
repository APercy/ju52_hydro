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
		local sc_ent = minetest.add_entity(pointed_pos, "ju52_hydro:ju52")
		if sc_ent and placer then
            local ent = sc_ent:get_luaentity()
            if ent then
                local owner = placer:get_player_name()
                ent.owner = owner
			    sc_ent:set_yaw(placer:get_look_horizontal())
			    itemstack:take_item()
                airutils.create_inventory(ent, ent._trunk_slots, owner)
            end
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

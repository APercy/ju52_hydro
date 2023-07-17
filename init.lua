ju52_hydro={}

function ju52_hydro.register_parts_method(self)
    --self._skin = self._vehicle_custom_data._skin

    local pos = self.object:get_pos()

    local wheels=minetest.add_entity(pos,'ju52_hydro:floaters')
    wheels:set_attach(self.object,'',{x=0,y=0,z=0},{x=0,y=0,z=0})
	-- set the animation once and later only change the speed
    wheels:set_animation({x = 1, y = 12}, 0, 0, true)
    self.wheels = wheels
    airutils.add_paintable_part(self, self.wheels)

    self.object:set_bone_position("aileron_base_r", {x=93.7994, y=3.35, z=-15.3002}, {x=180, y=-7.45, z=5.3})
    self.object:set_bone_position("aileron_base_l", {x=-93.7994, y=3.35, z=-15.3002}, {x=180, y=7.54, z=-5.3})

    self.object:set_bone_position("flap_base_l", {x=-49.2648, y=-1.41543, z=-12.0}, {x=0, y=185.4, z=0})
    self.object:set_bone_position("flap_base_r", {x=49.2648, y=-1.41543, z=-12.0}, {x=0, y=-185.4, z=0})

    --ju52.set_skin(self.object, self._skin, ju52.skin_texture)
end

function ju52_hydro.destroy_parts_method(self)
    if self.wheels then self.wheels:remove() end

    local pos = self.object:get_pos()
end

ju52_hydro.plane_properties = airutils.properties_copy(ju52.plane_properties)
ju52_hydro.plane_properties._tail_angle = 0
ju52_hydro.plane_properties._lift = 21
ju52_hydro.plane_properties.buoyancy = 0.25
ju52_hydro.plane_properties._max_speed = 8.5
ju52_hydro.plane_properties._speed_not_exceed = 15
ju52_hydro.plane_properties._ground_friction = 0.965
ju52_hydro.plane_properties._vehicle_name = "Ju52 3M Hydroplane"
--ju52_hydro.plane_properties._custom_step_additional_function = ju52_hydro.step_additional_function
ju52_hydro.plane_properties._register_parts_method = ju52_hydro.register_parts_method
ju52_hydro.plane_properties._destroy_parts_method = ju52_hydro.destroy_parts_method
ju52_hydro.plane_properties.initial_properties = airutils.properties_copy(ju52.plane_properties.initial_properties)
ju52_hydro.plane_properties.initial_properties.collisionbox = {-1.2, -3.31, -1.2, 1.2, 1, 1.2}
ju52_hydro.plane_properties.initial_properties.selectionbox = {-5, -3.31, -5, 5, 1, 5}

dofile(minetest.get_modpath("ju52_hydro") .. DIR_DELIM .. "crafts.lua")
dofile(minetest.get_modpath("ju52_hydro") .. DIR_DELIM .. "entities.lua")

--
-- items
--

settings = Settings(minetest.get_worldpath() .. "/ju52_hydro.conf")
local function fetch_setting(name)
    local sname = name
    return settings and settings:get(sname) or minetest.settings:get(sname)
end



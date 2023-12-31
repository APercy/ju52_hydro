
--
-- entity
--

ju52_hydro.vector_up = vector.new(0, 1, 0)

minetest.register_entity('ju52_hydro:floaters',{
initial_properties = {
	physical = false,
	collide_with_objects=false,
	pointable=false,
	visual = "mesh",
    backface_culling = false,
	mesh = "ju52_floaters.b3d",
	textures = {
            ju52.skin_texture, --suporte trem
        },
	},
	
    on_activate = function(self,std)
	    self.sdata = minetest.deserialize(std) or {}
	    if self.sdata.remove then self.object:remove() end
    end,
	    
    get_staticdata=function(self)
      self.sdata.remove=true
      return minetest.serialize(self.sdata)
    end,
	
})

minetest.register_entity('ju52_hydro:ju52',
    airutils.properties_copy(ju52_hydro.plane_properties)
)


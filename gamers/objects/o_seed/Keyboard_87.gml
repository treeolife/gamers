var cost_water = 20;

if (!has_been_interacted)
{
	if (collision_circle(x,y,radius,o_midori,false,true))
	{
		has_been_interacted = true;
		var value = 1;
		if (ds_map_exists(global.inventory, 2)) 
		{
			value += ds_map_find_value(global.inventory, 2);
			ds_map_replace(global.inventory, 2, value);
		} else 
		{
			ds_map_add(global.inventory, 2, 1);
		}
		
		if (global.water >= cost_water)
		{
			cactus_id = instance_create_layer(x,y+15,layer,o_cactus);
			cactus_id.visible = true;
			
			global.water -= cost_water;
		}
		instance_destroy(popup_w_id);
		instance_destroy();
	}
}

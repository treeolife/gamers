if (!has_been_interacted)
{
	ds_map_add(global.inventory, 0, 1);
	ds_map_add(global.inventory, 1, 1);
	if (collision_circle(x,y,radius,o_midori,false,true))
	{
		has_been_interacted = true;
		var value = 1;
		global.seeds++;
		if (ds_map_exists(global.inventory, 2)) 
		{
			value += ds_map_find_value(global.inventory, 2);
			ds_map_replace(global.inventory, 2, value);
		} else 
		{
			ds_map_add(global.inventory, 2, 1);
		}		
		instance_destroy(popup_e_id);
		instance_destroy(popup_w_id);
		instance_destroy();
	}
}
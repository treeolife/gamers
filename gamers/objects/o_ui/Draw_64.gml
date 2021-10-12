//global.stash = ds_map_values_to_array(global.inventory);

//draw_sprite_stretched
//(
//	s_inventory, 
//	0, 
//	x-6, 
//	y-6, 
//	12+rowLength*36, 
//	12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36
//);

draw_set_color(c_black);
draw_text(x,y-15,"seeds: " + string(global.seeds));
draw_text(x,y+5,"press x to plant seeds");

//for (var i = 0; i < INVENTORY_SLOTS; i += 1)
//{
//	var xx = x + (i mod rowLength) * 36 + 2;
//	var yy = y + (i div rowLength) * 36 + 2;
//	draw_sprite(s_slot,0,xx,yy)
//	if (global.stash[i] != -1)
//	{
//		draw_sprite(s_items,global.stash[i],xx,yy);
//	}
//}

water_max = 100;

waterbar_width = 324;
waterbar_height = 96;
waterbar_x = 40;
waterbar_y = ystart - 20;
draw_sprite(s_water,0,10,waterbar_y+30);
draw_sprite_stretched(s_healthbar_large_bg,0,waterbar_x,waterbar_y,waterbar_width,waterbar_height); 
draw_sprite_stretched(s_waterbar,0,waterbar_x,waterbar_y,clamp(global.water/water_max,0,1) * waterbar_width, waterbar_height); 
draw_sprite_stretched(s_healthbar_large_border,0,waterbar_x,waterbar_y,waterbar_width,waterbar_height); 
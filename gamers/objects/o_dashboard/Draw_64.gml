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

//draw_set_color(c_black);
//draw_text(x+150,y,"seeds: " + string(global.seeds));
//draw_text(x+150,y+20,"press x to plant seeds");

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

water_max = global.water;

waterbar_width = 250;
waterbar_height = 12;
waterbar_x = 20;
waterbar_y = ystart - 20;

global.water-=0.01;

draw_sprite_stretched(s_healthbar_bg,0,waterbar_x,waterbar_y,waterbar_width,waterbar_height); 
draw_sprite_stretched(s_waterbar,0,waterbar_x,waterbar_y,clamp(global.water/water_max,0,1) * waterbar_width, waterbar_height); 
draw_sprite_stretched(s_healthbar_border,0,waterbar_x,waterbar_y,waterbar_width,waterbar_height); 
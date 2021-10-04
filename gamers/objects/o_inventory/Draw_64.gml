//global.stash = ds_map_values_to_array(global.inventory);

draw_sprite_stretched
(
	s_inventory, 
	0, 
	x-6, 
	y-6, 
	12+rowLength*36, 
	12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36
);

draw_text(x+150,y,"seeds: " + string(global.seeds));
//draw_text(x+100,y+10,"dsmap: " + string(ds_map_values_to_array(global.inventory)));

for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
	var xx = x + (i mod rowLength) * 36 + 2;
	var yy = y + (i div rowLength) * 36 + 2;
	draw_sprite(s_slot,0,xx,yy)
	if (global.stash[i] != -1)
	{
		draw_sprite(s_items,global.stash[i],xx,yy);
	}
}
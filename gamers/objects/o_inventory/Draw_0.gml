camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

x = camera_x + x_difference;
y = camera_y + y_difference;

draw_sprite_stretched
(
	s_inventory, 
	0, 
	x-6, 
	y-6, 
	12+rowLength*36, 
	12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36
);

for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
	var xx = x + (i mod rowLength) * 36 + 2;
	var yy = y + (i div rowLength) * 36 + 2;
	draw_sprite(s_slot,0,xx,yy)
	if (inventory[i] != -1)
	{
		draw_sprite(s_items,inventory[i],xx,yy);
	}
}
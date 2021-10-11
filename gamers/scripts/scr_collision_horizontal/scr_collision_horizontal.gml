function scr_collision_horizontal(horizontal_speed,tilemap,x,bbox_left,bbox_right,bbox_top,bbox_bottom)
{
	var p1,p2,bbox_side,hsp=horizontal_speed;
	
	// Direction of front pixel
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
	// For slope - ignore bottom front pixel
	if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1) p2 = 0;
	// Inside a tile with collision
	if ((p1 == 1) || (p2 == 1))
	{
		if (hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right-x);
		else x = x - (x mod TILE_SIZE) - (bbox_left - x);
		hsp = 0;
		return hsp;
	}
	return hsp;
}
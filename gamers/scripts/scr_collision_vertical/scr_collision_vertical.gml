function scr_collision_vertical(vertical_speed,tilemap,x,bbox_left,bbox_right,bbox_top,bbox_bottom) 
{
	var p1,p2,bbox_side,vsp=vertical_speed;
	
	if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+vsp) <= 1)
	{
		if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
		p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp);
		p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp);
		// Inside a tile with collision
		if ((p1 == 1) || (p2 == 1))
		{
			if (vsp > 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom-y);
			else y = y - (y mod TILE_SIZE) - (bbox_top - y);
			vsp = 0;
			return vsp;
		}
	}
	return vsp;
}
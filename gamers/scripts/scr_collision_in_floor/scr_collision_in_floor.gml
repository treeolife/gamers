/// @description Checks if position is below floor height of a given file, returns floor depth
/// @arg tilemap
/// @arg x
/// @arg y
function scr_collision_in_floor(tilemap,x_pos,y_pos)
{
	var pos = tilemap_get_at_pixel(tilemap,x_pos,y_pos)
	if (pos > 0)
	{
		// solid tile
		if (pos <= TILE_SOLID_NUMBER) return (y_pos mod TILE_SIZE);

		var the_floor = global.heights[(x_pos mod TILE_SIZE) + (pos * TILE_SIZE)];
		// returns -ve if above, +ve if below the_floor
		return ((y_pos mod TILE_SIZE) - the_floor);
	} else return -(TILE_SIZE - (y_pos mod TILE_SIZE));
}

// Is my middle center touching floor at the start of frame
function scr_collision_grounded(tilemap,position_x,position_bottom_middle)
{
	var above_floor = (scr_collision_in_floor(tilemap,position_x,position_bottom_middle+1) >= 0);
	return above_floor;
}
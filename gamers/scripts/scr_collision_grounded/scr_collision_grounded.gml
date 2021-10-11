// Is my middle center touching floor at the start of frame
function scr_collision_grounded(tilemap,position_x,position_bottom_middle)
{
	var above_floor = (scr_collision_in_floor(tilemap,position_x,position_bottom_middle+1) >= 0);
	return above_floor;
}
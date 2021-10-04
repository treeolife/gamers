/// @arg x_speed
/// @arg y_speed
function move_and_collide(x_speed, y_speed) 
{
	if not place_meeting(x+x_speed, y, o_wall)
	{
		x += x_speed;
	}
	
	if not place_meeting(x, y+y_speed, o_wall)
	{
		y += y_speed;
	}
}
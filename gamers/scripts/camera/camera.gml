function cam_follow_position(x_to,y_to,cam_speed)
{
	frames_per_update = 100 / cam_speed;
	x += (x_to - x)/frames_per_update;
	y += (y_to - y)/frames_per_update;	
}

function cam_clamp_to_map(view_w_half,view_h_half)
{
	x = clamp(x,view_w_half,room_width-view_w_half);
	y = clamp(y,view_h_half,room_height-view_h_half);
}

///@arg object_to_follow
///@arg view_width
///@arg view_height
///@arg cam_speed
function cam_follow(follow,view_width,view_height,cam_speed=4)
{
	view_w_half = view_width * 0.5;
	view_h_half = view_height * 0.5;
	
	x_to = xstart;
	y_to = ystart;
	
	// Get destination to follow
	if (instance_exists(follow))
	{
		x_to = follow.x;
		y_to = follow.y;
	}

	cam_follow_position(x_to,y_to,cam_speed);

	cam_clamp_to_map(view_w_half,view_h_half);

	camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
}
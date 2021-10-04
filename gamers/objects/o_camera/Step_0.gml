x += (x_to - x)/25;
y += (y_to - y)/25;


if (follow != noone)
{
	x_to = follow.x;
	y_to = follow.y;
}

var view_matrix = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,view_matrix);

view_camera[0] = camera;
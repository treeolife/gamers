camera = camera_create();

var view_matrix = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var proj_matrix = matrix_build_projection_ortho(640,480,1,10000);

camera_set_view_mat(camera,view_matrix);
camera_set_proj_mat(camera,proj_matrix);

view_camera[0] = camera;
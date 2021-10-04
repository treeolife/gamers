#macro INVENTORY_SLOTS 12
rowLength = 6;
inventory = array_create(INVENTORY_SLOTS, -1);

inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 1;

x_difference = x - camera_get_view_x(view_camera[0]);
y_difference = y - camera_get_view_y(view_camera[0]);
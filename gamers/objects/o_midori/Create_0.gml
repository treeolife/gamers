tilemap = layer_tilemap_get_id("Collision");

//image_speed = 0.4;
hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;

global.seeds = 0;
global.inventory = ds_map_create();

state = "move";

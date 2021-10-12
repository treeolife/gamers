event_inherited();

tilemap = layer_tilemap_get_id("Collision");

pollution_speed = SPD_WALK / 16;
hsp = pollution_speed;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
go_left = true;
damage = 0.1;
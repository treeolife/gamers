draw_self();

hp = 100;

if (hp != noone and DEBUG) {
	draw_text_transformed(x-TILE_SIZE/2,y-TILE_SIZE,"hp: " + string(hp),0.5,0.5,1);
}
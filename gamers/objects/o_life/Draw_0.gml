draw_self();

if (hp <= 0)
{
	instance_destroy();
}

if (flash > 0)
{
	flash--;
	shader_set(sh_white);
	draw_self();
	shader_reset();
}

hp+=0.01;

var pixels_up = sprite_height+4;
healthbar_width = sprite_width;

if (draw_bar)
{
	draw_sprite_stretched(s_healthbar_bg,0,x-healthbar_width/2,y-pixels_up,healthbar_width,healthbar_height); 
	if (defender) draw_sprite_stretched(s_healthbar_g,0,x-healthbar_width/2,y-pixels_up,clamp(hp/hp_max,0,1) * healthbar_width, healthbar_height); 
	else draw_sprite_stretched(s_healthbar,0,x-healthbar_width/2,y-pixels_up,clamp(hp/hp_max,0,1) * healthbar_width, healthbar_height); 
	draw_sprite_stretched(s_healthbar_border,0,x-healthbar_width/2,y-pixels_up,healthbar_width,healthbar_height); 
}


function scr_text_outline(xx,yy,offset,txt,x_scale=1,y_scale=1,angle=0)
{
	draw_set_color(c_black);
	draw_text_transformed(xx-offset,yy,txt,x_scale,y_scale,angle);
	draw_text_transformed(xx+offset,yy,txt,x_scale,y_scale,angle);
	draw_text_transformed(xx,yy-offset,txt,x_scale,y_scale,angle);
	draw_text_transformed(xx,yy+offset,txt,x_scale,y_scale,angle);
}
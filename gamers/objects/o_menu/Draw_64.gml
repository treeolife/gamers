/// @desc Draw Menu

var offset = menu_txt_offset;

draw_set_font(fTitle);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
scr_text_outline(40,30,offset,"Tree of Life",1,1,0);
draw_set_color(c_white);
draw_text_transformed(40,30,"Tree of Life",1,1,0);
draw_set_font(fMenu);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var col;
	var txt		= menu[i];
	if (menu_cursor == i)
	{	
		txt = string_insert("> ", txt, 0);
		col = c_white;
	}
	else
	{
		col = c_gray;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	
	scr_text_outline(xx,yy,offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}
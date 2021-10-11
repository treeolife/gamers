/// @desc GUI setup

enum menu_options
{
	level_one	= 5,
	level_two	= 4,
	level_three	= 3,
	boss		= 2,
	restart		= 1,
	quit		= 0,
}

gui_width	= display_get_gui_width();
gui_height	= display_get_gui_height();
gui_margin	= 32;

menu_x			= gui_width+200;
menu_y			= gui_height - gui_margin;
menu_x_target	= gui_width - gui_margin;
menu_speed		= 25; // lower is faster
menu_font		= fMenu;
menu_itemheight = font_get_size(menu_font);
menu_committed	= -1;
menu_control	= true;
menu_txt_offset	= 2;

menu[menu_options.level_one]	= "Level 1";
menu[menu_options.level_two]	= "Level 2";
menu[menu_options.level_three]	= "Level 3";
menu[menu_options.boss]			= "Boss";
menu[menu_options.restart]		= "Restart"
menu[menu_options.quit]			= "Quit";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = menu_options.level_one;
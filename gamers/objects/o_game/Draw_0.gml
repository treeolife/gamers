/// @description Build slope height table then start game

draw_tilemap(tile_map_id,0,0);
for (var i = heights_to_get - 1; i >= 0; i--)
{
	var check = 0;
	while (check <= TILE_SIZE)
	{
		global.heights[i] = check;
		if (check == TILE_SIZE) break;
		// surface_getpixel returns color of pixel
		if (surface_getpixel(application_surface,i,check) != c_black) break;
		check++;
	}
}

room_goto_next();
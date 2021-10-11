
heights_to_get = sprite_get_width(s_collision);
tiles = heights_to_get / TILE_SIZE;

// create tiles
var layerid = layer_create(0, "Tiles");
tile_map_id = layer_tilemap_create(layerid,0,0,t_collision,tiles,1);

for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tile_map_id,i,i,0);
}
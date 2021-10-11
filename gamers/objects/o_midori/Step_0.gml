// Keyboard inputs
key_left	= keyboard_check(vk_left)	|| keyboard_check(ord("A"));
key_right	= keyboard_check(vk_right)	|| keyboard_check(ord("D"));
key_jump	= keyboard_check(vk_space);

if (key_right)
	image_xscale = -1;
if (key_left)
	image_xscale = 1;

var player_speed = SPD_WALK;

hsp = scr_movement_input(key_right,key_left,player_speed);
vsp += SPD_GRAVITY;  

#region When to Jump
var grounded_bottom_middle	= scr_collision_grounded(tilemap,x,bbox_bottom);
var grounded_bottom_left	= scr_collision_grounded(tilemap,bbox_left,bbox_bottom);
var grounded_bottom_right	= scr_collision_grounded(tilemap,bbox_right,bbox_bottom);
if (grounded_bottom_middle || grounded_bottom_left || grounded_bottom_right)
{
	if (key_jump)
	{
		vsp = -SPD_JUMP;
		grounded_bottom_middle = false; // Only one jump for first contact with ground
	}
}
#endregion

#region Dump and store pixel perfect collisions and fractions for h and v speed integers
hsp += hsp_fraction;
hsp_fraction = scr_get_fraction(hsp);
hsp -= hsp_fraction;

vsp += vsp_fraction;
vsp_fraction = scr_get_fraction(vsp);
vsp -= vsp_fraction;
#endregion

#region Horizontal collision
hsp = scr_collision_horizontal(hsp,tilemap,x,bbox_left,bbox_right,bbox_top,bbox_bottom);
x += hsp;
#endregion

#region Vertical collision
vsp = scr_collision_vertical(vsp,tilemap,x,bbox_left,bbox_right,bbox_top,bbox_bottom);

var floor_dist = scr_collision_in_floor(tilemap,x,bbox_bottom+vsp);
if (floor_dist >= 0)
{
	y += vsp;
	y -= (floor_dist + 1);
	vsp = 0;
	floor_dist = -1;
}

y += vsp;
#endregion

#region Walk down slopes
if (grounded_bottom_middle)
{
	y += abs(floor_dist)-1;
	// if at base of current tile
	if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE - 1)
	{
		// if the slope continues
		if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+1) > 1)
		{
			// move there
			y += abs(scr_collision_in_floor(tilemap,x,bbox_bottom+1));
		}
	}
}
#endregion
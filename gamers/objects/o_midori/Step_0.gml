// Keyboard inputs
key_left	= keyboard_check(vk_left)	|| keyboard_check(ord("A"));
key_right	= keyboard_check(vk_right)	|| keyboard_check(ord("D"));
key_jump	= keyboard_check(vk_space);
key_plant	= ord("X");

var player_speed = SPD_WALK;

hsp = scr_movement_horizontal_player_input(key_right,key_left,player_speed);
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
hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hsp_fraction;

vsp += vsp_fraction;
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;
#endregion

#region Temp vars
var p1,p2,bbox_side;
#endregion

#region Horizontal collision
// Direction of front pixel
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
// For slope - ignore bottom front pixel
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1) p2 = 0;
// Inside a tile with collision
if ((p1 == 1) || (p2 == 1))
{
	if (hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right-x);
	else x = x - (x mod TILE_SIZE) - (bbox_left - x);
	hsp = 0;
}

x += hsp;
#endregion

#region Vertical collision
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+vsp) <= 1)
{
	if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp);
	p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp);
	// Inside a tile with collision
	if ((p1 == 1) || (p2 == 1))
	{
		if (vsp > 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom-y);
		else y = y - (y mod TILE_SIZE) - (bbox_top - y);
		vsp = 0;
	}
}

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

#region Plant seed
if (keyboard_check_pressed(key_plant) && global.seeds > 0)
{
	seed_id = instance_create_layer(x,y-1,layer,o_seed);
	global.seeds--;
}
#endregion

switch (state)
{
	case "move": 
		#region Move State
		if key_right
		{
			image_xscale = -1;
		}

		if key_left
		{
			image_xscale = 1;
		}
		#endregion
		break;
		
	case "plant":
		#region Plant State
		#endregion
		break;
}

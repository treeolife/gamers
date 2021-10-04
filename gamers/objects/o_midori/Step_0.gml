#region Temp vars
var p1,p2,bbox_side;
#endregion

// Keyboard inputs
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check(vk_space);
key_water = ord("C");
key_plant = ord("X");

#region Calculate movement
move = (key_right - key_left) * SPD_WALK
hsp = move;
//vsp += (key_down - key_up) * SPD_WALK;
vsp += SPD_GRAVITY;
#endregion

// Is my middle center touching floor at the start of frame
var grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);

#region Jump
if (grounded || (in_floor(tilemap,bbox_left,bbox_bottom+1) >= 0) || (in_floor(tilemap,bbox_right,bbox_bottom+1) >= 0))
{
	if (key_jump)	
	{
		vsp = -SPD_JUMP;
		grounded = false;
	}
}
#endregion

#region Fractions
// Re apply fractions
hsp += hsp_fraction;
vsp += vsp_fraction;

// Store and remove fractions
// Important: go into collisions with whole integers only
hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hsp_fraction;
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;
#endregion

#region Horizontal collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
// For slope - ignore bottom side tiles
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

var floor_dist = in_floor(tilemap,x,bbox_bottom+vsp);
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
if (grounded)
{
	y += abs(floor_dist)-1;
	// if at base of current tile
	if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE - 1)
	{
		// if the slope continues
		if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+1) > 1)
		{
			// move there
			y += abs(in_floor(tilemap,x,bbox_bottom+1));
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
			// move_and_collide(4, 0);
			image_xscale = -1;
		}

		if key_left
		{
			// move_and_collide(-4, 0);
			image_xscale = 1;
		}
		#endregion
		break;
		
	case "plant":
		#region Plant State
		#endregion
		break;
}

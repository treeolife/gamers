#region Temp vars
var p1,p2,bbox_side;
#endregion

vsp += SPD_GRAVITY;

#region Fractions
// Re apply fractions
vsp += vsp_fraction;

// Store and remove fractions
// Important: go into collisions with whole integers only
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;
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

// Is my middle center touching floor at the start of frame
var grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);

if (grounded && !created)
{
	popup_e_id = instance_create_layer(x-16,y-32,layer,o_popup_e);
	popup_w_id = instance_create_layer(x-16,y-64,layer,o_popup_w);
	popup_e_id.visible = false;
	popup_w_id.visible = false;
	created = true;
}

#region Pop up interaction
if (!has_been_interacted and grounded)
{
	if (collision_circle(x,y,radius,o_midori,false,true))
	{
		popup_e_id.visible = true;
		popup_w_id.visible = true;
	} 
	else 
	{
		popup_e_id.visible = false;
		popup_w_id.visible = false;
	}
}
#endregion
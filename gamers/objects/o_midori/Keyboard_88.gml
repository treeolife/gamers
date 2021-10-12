#region Plant seed
if (global.seeds > 0 && !collision_circle(x,y,10,o_seed,false,false))
{
	instance_create_layer(x,y-1,layer,o_seed);
	global.seeds--;
}
#endregion
#region Plant seed
if (global.seeds > 0)
{
	instance_create_layer(x,y-1,layer,o_seed);
	global.seeds--;
}
#endregion
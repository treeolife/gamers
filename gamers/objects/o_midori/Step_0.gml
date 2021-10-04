switch (state)
{
	case "move": 
		#region Move State
		if keyboard_check(vk_right)
		{
			move_and_collide(4, 0);
			image_xscale = -1;
		}

		if keyboard_check(vk_left)
		{
			move_and_collide(-4, 0);
			image_xscale = 1;
		}
		#endregion
		break;
		
	case "plant":
		#region Plant State
		#endregion
		break;
}

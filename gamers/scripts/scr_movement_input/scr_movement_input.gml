function scr_movement_input(key_right,key_left,player_speed)
{
	var move = (key_right - key_left) * player_speed;
	return move;
}
function scr_movement_horizontal() 
{
	
}

function scr_movement_horizontal_player_input(key_right,key_left,player_speed)
{
	var move = (key_right - key_left) * player_speed;
	return move;
}
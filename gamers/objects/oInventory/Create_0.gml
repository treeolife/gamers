/// @DnDAction : YoYo Games.Common.Macro
/// @DnDVersion : 1
/// @DnDHash : 6FAED7C4
/// @DnDArgument : "macro" "INVENTORY_SLOTS"
/// @DnDArgument : "value" "15"
#macro INVENTORY_SLOTS 15

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 6EC79C32
/// @DnDInput : 2
/// @DnDArgument : "var" "rowLength"
/// @DnDArgument : "value" "6"
/// @DnDArgument : "var_1" "inventory"
/// @DnDArgument : "value_1" "array_create(INVENTORY_SLOTS, -1);"
var rowLength = 6;
var inventory = array_create(INVENTORY_SLOTS, -1);;

/// @DnDAction : YoYo Games.Random.Randomize
/// @DnDVersion : 1
/// @DnDHash : 7627C008
randomize();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 22BC0C74
/// @DnDInput : 3
/// @DnDArgument : "var" "inventory[0]"
/// @DnDArgument : "var_1" "inventory[1]"
/// @DnDArgument : "var_2" "inventory[2]"
inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 0;
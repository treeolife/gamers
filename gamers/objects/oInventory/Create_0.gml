/// @DnDAction : YoYo Games.Common.Macro
/// @DnDVersion : 1
/// @DnDHash : 6FAED7C4
/// @DnDArgument : "macro" "INVENTORY_SLOTS"
/// @DnDArgument : "value" "15"
#macro INVENTORY_SLOTS 15

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1E809704
/// @DnDInput : 2
/// @DnDArgument : "expr" "6"
/// @DnDArgument : "expr_1" "array_create(INVENTORY_SLOTS, -1)"
/// @DnDArgument : "var" "rowLength"
/// @DnDArgument : "var_1" "inventory"
rowLength = 6;
inventory = array_create(INVENTORY_SLOTS, -1);

/// @DnDAction : YoYo Games.Random.Randomize
/// @DnDVersion : 1
/// @DnDHash : 7627C008
randomize();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 22BC0C74
/// @DnDInput : 3
/// @DnDArgument : "expr_2" "1"
/// @DnDArgument : "var" "inventory[0]"
/// @DnDArgument : "var_1" "inventory[1]"
/// @DnDArgument : "var_2" "inventory[2]"
inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 1;
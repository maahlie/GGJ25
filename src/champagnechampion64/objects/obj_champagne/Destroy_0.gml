/// @description Insert description here
// You can write your code in this editor
var inst = instance_find(obj_table, irandom(instance_number(obj_table) - 1));
with inst
{
	instance_create_layer(x+random_range(-12,12),y+random_range(-12,12),"Instances_1",obj_champagne)
}


/// @description Insert description here
// You can write your code in this editor

if staring = true
{
	self.direction = point_direction(x,y,obj_player.x,obj_player.y)
}
else
{
	_inst = instance_nearest(x,y,obj_table)
	self.direction = point_direction(x,y,_inst.x,_inst.y)
}
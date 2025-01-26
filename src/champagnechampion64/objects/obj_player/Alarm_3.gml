/// @description Insert description here
// You can write your code in this editor

global.convo = false;
if obj_player.suspicion > obj_player.maxsus
{
	obj_player.overtime = obj_player.overstart
	global.gameover = true
}



popped  = false

with obj_npc 
{
	staring = false
}

with obj_bubble 
				{
					instance_destroy()
				}
				

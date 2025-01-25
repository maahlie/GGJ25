/// @description Insert description here
// You can write your code in this editor


if y-radi < -32 or y+radi > 252 
{
	dy *= -1
}

if x-radi < -32 or x+radi > 512
{
	dx *= -1
}

if obj_player.cursx > x 
{
	dx -= 0.01
}
else
{
	dx += 0.01
}

if obj_player.cursy > y
{
	dy -= 0.01
}
else
{
	dy += 0.01
}


x+=dx
y+=dy
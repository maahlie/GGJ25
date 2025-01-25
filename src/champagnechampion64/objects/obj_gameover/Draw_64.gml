/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center)
draw_set_font(fnt_points)
draw_text_outlined(240,32,"YOU GOT BUSTED",c_white,c_blue,1)
draw_text_outlined(240,32,"YOU GOT BUSTED",c_white,c_blue,2)


draw_text_outlined(240,108,"You quaffed a total of:",c_white,c_blue,1)
draw_text_outlined(240,132,string(global.points)+" glasses",c_white,c_blue,1)
draw_text_outlined(240,156,"of champagne",c_white,c_blue,1)


var fy = 200
if global.points > 30
{
	draw_text_outlined(240,fy,"The glutonous beast has been satisfied",c_white,c_blue,1)
}
else if global.points > 20
{
	draw_text_outlined(240,fy,"You got absolutely hammered!",c_white,c_blue,1)
}
else if global.points > 10
{
	draw_text_outlined(240,fy,"You felt the buzz!",c_white,c_blue,1)
}
else if global.points > 2
{
	draw_text_outlined(240,fy,"To the next party I guess?",c_white,c_blue,1)
}
else
{
	draw_text_outlined(240,fy,"What did you even do there?",c_white,c_blue,1)
}
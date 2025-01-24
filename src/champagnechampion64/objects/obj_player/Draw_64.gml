

draw_sprite(spr_sus_hud,-1,96,0)

draw_set_color(c_yellow)
draw_set_halign(fa_left)
draw_set_font(fnt_points)

draw_text_outlined(360,8,string(points),c_yellow,c_black,1)

draw_set_font(fnt_ingame)
if canint
{
	draw_set_halign(fa_center)
	draw_text_outlined(240,220,"QUAFF CHAMPAGNE",c_yellow,c_black,1);
	draw_sprite(spr_cursor,cursspr,240,135)
}

draw_set_color(c_white)
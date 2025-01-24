display_set_gui_size(480, 270);

draw_sprite(spr_sus_hud,-1,96,0)

draw_set_color(c_yellow)
draw_set_halign(fa_left)
draw_set_font(fnt_ingame)

draw_text(360,8,string(points))


if canint
{
	draw_set_halign(fa_center)
	draw_text(240,220,"QUAFF CHAMPAGNE")
}

draw_set_color(c_white)
/// @description Insert description here
// You can write your code in this editor
if !lol
{
	//draw_sprite(spr_cursor,curspressed,cursx,cursy)

	draw_set_halign(fa_left)
	draw_set_color(c_yellow)
	draw_set_font(fnt_credis)
	draw_text(16,222,"ART: KRAVITY\nAUDIO: MAAHLIE\nPROGRAMMING: JALECKO")
	draw_sprite(spr_logo,0,240,16)
	draw_text_outlined(352,80,"HIGHSCORE: "+string(global.hscore),c_yellow,c_red,1)
}
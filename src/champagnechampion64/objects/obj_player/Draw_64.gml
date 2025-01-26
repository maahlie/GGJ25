if global.convo and not global.gameover
{
	draw_sprite(spr_dialog,0,240,270)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(fnt_dialog)
	draw_text(240,240,string(global.textoptions[currentint,0]))
	
	with obj_bubble 
	{
		if !exposed
		{
			if !hidden 
			{
			draw_sprite(spr_bubble,0,x,y)	
			draw_set_halign(fa_center);
			draw_text_outlined(x,y,string(txt),c_white,toutline,1);
			}
		}
		else
		{
			draw_text_outlined(x,y,string(txt),c_white,c_black,1);
		}
		//draw_text_outlined(x,y,string(txt),c_white,#eeeeee,1);
	}
	
	draw_set_valign(fa_top)
	draw_sprite(spr_cursor,curspressed,cursx,cursy)
}
else
{
	draw_sprite(spr_sus_hud,-1,96,0)
	var bx = 8
	var by = 6
	
	draw_set_color(c_yellow)
	
	if suspicion >=100
	{
		draw_set_color(c_red)
	}
	
	if suspicion>0
	{
		draw_rectangle(bx,by,bx+suspicion*1.75,by+19,false)
	}
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(fnt_points)
	
	draw_sprite(spr_champagne_spin,winefr,304,-4)
	draw_text_outlined(350,8,": "+string(points),c_yellow,c_black,1)

	draw_set_font(fnt_ingame)
	if canint
	{
		draw_set_halign(fa_center)
		draw_text_outlined(240,220,"QUAFF CHAMPAGNE",c_yellow,c_black,1);
		draw_sprite(spr_cursor,cursspr,240,135)
	}
}


if global.gameover
{
	if overtime < 260
	{
		draw_set_font(fnt_notices)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text_outlined(240,135,"BUSTED",c_white,c_red,1);
		draw_text_outlined(240,135,"BUSTED",c_white,c_red,2);
	}
}

draw_set_color(c_white)


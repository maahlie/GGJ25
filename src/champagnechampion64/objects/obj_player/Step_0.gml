var dt = game_get_speed(gamespeed_microseconds) / 1000000;

if (keyboard_check_pressed(vk_tab)) {
    self.mouselock = !self.mouselock;
}

if (!window_has_focus()) return;
if (!self.mouselock) return;

if global.convo = false
{
	self.direction += global.cursordx//(window_mouse_get_x() - window_get_width() / 2) / 10;
	self.pitch += global.cursordy//(window_mouse_get_y() - window_get_height() / 2) / 10;
	self.pitch = clamp(self.pitch, -80, 80);

	cursspr+=0.1

	self.max_speed = 120;

	if global.left_hold
	{
	    dx -= dsin(self.direction) * self.max_speed;
	    dy -= dcos(self.direction) * self.max_speed;
	}

	if global.right_hold
	{
	    dx += dsin(self.direction) * self.max_speed;
	    dy += dcos(self.direction) * self.max_speed;
	}

	if global.up_hold 
	{
	    dx += dcos(self.direction) * self.max_speed;
	    dy -= dsin(self.direction) * self.max_speed;
	}

	if global.down_hold
	{
	    dx -= dcos(self.direction) * self.max_speed;
	    dy += dsin(self.direction) * self.max_speed;
	}

	dx *= dt;
	dy *= dt;

	repeat (floor(abs(dx))) {
	    if (!place_meeting(self.x + sign(dx), self.y, obj_block)) {
	        self.x += sign(dx);
	    }
	}
	if (!place_meeting(self.x + frac(abs(dx)) * sign(dx), self.y, obj_block)) {
	    self.x += frac(abs(dx)) * sign(dx);
	}

	repeat (floor(abs(dy))) {
	    if (!place_meeting(self.x, self.y + sign(dy), obj_block)) {
	        self.y += sign(dy);
	    }
	}
	if (!place_meeting(self.x, self.y + frac(abs(dy)) * sign(dy), obj_block)) {
	    self.y += frac(abs(dy)) * sign(dy);
	}

	if place_meeting(self.x, self.y, obj_champagne)
	{
		canint = true;
	}
	else
	{
		canint = false;
	}
	
	if suspicion >= 100 
	{
		global.gameover = true
		//room = rm_gameover;
	}
	
}
else
{
	cursdx = -global.cursordx + (global.right_hold - global.left_hold)*4
	cursdy = global.cursordy + (global.down_hold - global.up_hold)*4
	
	cursx += cursdx
	cursy += cursdy
	
	curspressed = global.a_hold
	
	convotime++
	
	if convotime > maxconvotime
	{
		global.convo = false
		suspicion += 50
	}
	
	if (global.a_pressed)
	{
		with obj_bubble 
		{
			if point_distance(x,y,obj_player.cursx,obj_player.cursy) < 48
			{
				obj_player.suspicion += val;
				global.convo = false;
				instance_destroy()
			}
		}
	}
}

if canint
{
	var _inst = instance_place(self.x, self.y, obj_champagne);
	if (global.a_pressed)
	{
		
		points++;
		global.convo = true
		cursx = 240;
		cursy = 135;
		canint = false
		convotime = 0
		
		bub0 = instance_create_depth(100,100,-99999,obj_bubble)
		bub0.txt = global.textoptions[0,1];
		bub0.val = global.textoptions[0,5];
		
		bub1 = instance_create_depth(200,100,-99999,obj_bubble)
		bub1.txt = global.textoptions[0,2];
		bub1.val = global.textoptions[0,6];
		
		bub2 = instance_create_depth(100,200,-99999,obj_bubble)
		bub2.txt = global.textoptions[0,3];
		bub2.val = global.textoptions[0,7];
		
		bub2 = instance_create_depth(200,200,-99999,obj_bubble)
		bub2.txt = global.textoptions[0,4];
		bub2.val = global.textoptions[0,8];
		
		with _inst 
		{
			instance_destroy()
		}
	}
}

if suspicion < 0
{
suspicion = 0
}

//if (global.a_pressed) /
//{
//    self.ThrowBalloon();
//}

if (global.b_pressed)
{
	gamepad_set_vibration(0,1,1)
	alarm[0] = 30
}
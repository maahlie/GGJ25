var dt = game_get_speed(gamespeed_microseconds) / 1000000;


if points > 7
{
	t++
	var amp = 0.15
	if points > 14 { amp = 0.4 }
	if points > 29 { amp = 0.6 }

	fovxmod = amp*sin(t/60)
}

if (keyboard_check_pressed(vk_tab)) 
{
    self.mouselock = !self.mouselock;
}

if (!window_has_focus()) return;
if (!self.mouselock) return;

if global.convo = false
{
	self.direction += global.cursordx//(window_mouse_get_x() - window_get_width() / 2) / 10;
	//self.pitch += global.cursordy//(window_mouse_get_y() - window_get_height() / 2) / 10;
	//self.pitch = clamp(self.pitch, -80, 80);
	
	

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
	
	if points > 13
	{
		var pp = 1
		pp = points/10;
		
		if pp>8 
		{
			pp = 8
		}
		
		cursdx+=random_range(-pp,pp)
		cursdy+=random_range(-pp,pp)
	}
	
	cursx += cursdx
	cursy += cursdy
	
	curspressed = global.a_hold
	
	if !popped 
	{
	convotime++
	}
	
	if convotime > maxconvotime 
	{
		global.convo = false
		suspicion += 50
		
		audio_play_sound(snd_mmm,10,false)
		
		with obj_npc 
		{
			staring = false
		}
		
		if suspicion > maxsus
		{
			overtime = overstart
			global.gameover = true
			
		}
		
		with obj_bubble 
		{
			instance_destroy()
		}
	}
	
	if (global.a_pressed)
	{
		with obj_bubble 
		{
			if point_distance(x,y,obj_player.cursx,obj_player.cursy) < radi and !hidden
			{
				
				obj_player.popped = true
				
				if val > 10
				{
					son = choose(snd_huh0,snd_huh1,snd_huh2)
					audio_play_sound(son,10,false)
					gamepad_set_vibration(0,1,1)
					alarm[0] = 30
				}
				
				obj_player.suspicion += val;
				
				audio_play_sound(snd_pop,10,false)
				
				
				//obj_player.currentint = global.points % obj_player.interactcount
				obj_player.alarm[3] = 60
				
				
				exposed = true
				with obj_bubble 
				{
					//instance_destroy()
					hidden = true
				}
				
				
			}
		}
	}
}

if canint and !global.gameover
{
	var _inst = instance_place(self.x, self.y, obj_champagne);
	if (global.a_pressed)
	{
		audio_play_sound(snd_quaff0,10,false)
		
		for (var i = 0; i<24; i++)
		{
			var bub = instance_create_layer(_inst.x,_inst.y,"Instances_1",obj_bubparticle)
			bub.z = _inst.z+5
			bub.dx = random_range(-1.5,1.5)
			bub.dy = random_range(-1.5,1.5)
			bub.dz = random_range(3,4)
			bub.alarm[0] = random_range(10,14)
		}
		
		var r=0
		
		r=irandom(99)
		
		if r >79
		{
			alarm[2] = 50
		}
		var oldint = obj_player.currentint
		
		if global.points < 10
		{
			obj_player.currentint = irandom(9)
		}
		else
		{
			obj_player.currentint = irandom(obj_player.interactcount-1)
		}
		
		if obj_player.currentint == oldint
		{
			obj_player.currentint += 1 
			obj_player.currentint %= obj_player.interactcount
		}
		
		points++;
		global.convo = true
		cursx = 240;
		cursy = 135;
		canint = false
		convotime = 0
		
		alarm[1] = 150
		
		target = instance_nearest(x, y, obj_npc);
		target.staring = true
		direction = point_direction( x, y, target.x, target.y)
		
		with _inst 
		{
			instance_destroy()
		}
	}
}

if overtime == 260
{
	audio_play_sound(snd_thub,10,false);
}

if suspicion < 0
{
suspicion = 0
}

if suspicion > 100
{
suspicion = 100
}

if global.gameover
{
	overtime--;
	
	if overtime < 300
	{
		audio_stop_sound(peopltalk)
	}
	
	if overtime <= 0
	{
		audio_play_sound(snd_thub,10,false);
		room = rm_gameover
	}
}

winefr+=1

//if (global.b_pressed)
//{
//	points++;
//	gamepad_set_vibration(0,1,1)
//	alarm[0] = 30
//}
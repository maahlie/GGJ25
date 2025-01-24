var dt = game_get_speed(gamespeed_microseconds) / 1000000;

if (keyboard_check_pressed(vk_tab)) {
    self.mouselock = !self.mouselock;
}

if (!window_has_focus()) return;
if (!self.mouselock) return;

self.direction += global.cursordx//(window_mouse_get_x() - window_get_width() / 2) / 10;
self.pitch += global.cursordy//(window_mouse_get_y() - window_get_height() / 2) / 10;
self.pitch = clamp(self.pitch, -80, 80);



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

if canint
{
	var _inst = instance_place(self.x, self.y, obj_champagne);
	if (global.a_pressed)
	{
		
		points++;
		
		with _inst 
		{
			instance_destroy()
		}
	}
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
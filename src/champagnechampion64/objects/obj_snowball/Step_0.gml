var dt = game_get_speed(gamespeed_microseconds) / 1000000;

self.x += self.xspeed * dt;
self.y += self.yspeed * dt;
self.z += self.zspeed * dt;

self.zspeed += self.zgravity * dt;

if (self.z < 0) {
    instance_destroy();
}
/*
if (place_meeting(self.x, self.y, obj_block)) {
    instance_destroy();
}
*/
if (place_meeting(self.x, self.y, obj_player)) {
    obj_player.OnSnowball();
    instance_destroy();
}
if (place_meeting(self.x, self.y, obj_base)) {
    obj_base.OnSnowball();
    instance_destroy();
}
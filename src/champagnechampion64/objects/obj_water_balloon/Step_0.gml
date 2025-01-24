var dt = game_get_speed(gamespeed_microseconds) / 1000000;

self.x += self.xspeed * dt;
self.y += self.yspeed * dt;
self.z += self.zspeed * dt;

self.zspeed += self.zgravity * dt;

if (self.z < 0) {
    instance_destroy();
}
    
var instance_list = ds_list_create();

if (self.z <= 32) {
    for (var i = 0, n = instance_place_list(self.x, self.y, obj_block, instance_list, false); i < n; i++) {
        instance_list[| i].OnHit();
        instance_destroy();
    }
}

ds_list_destroy(instance_list);
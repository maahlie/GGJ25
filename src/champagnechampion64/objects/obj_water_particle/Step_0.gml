var dt = game_get_speed(gamespeed_microseconds) / 1000000;

self.x += self.xspeed * dt;
self.y += self.yspeed * dt;
self.z += self.zspeed * dt;

self.zspeed += self.zgravity * dt;

self.lifespan -= dt;

if (self.lifespan <= 0) {
    instance_destroy();
}
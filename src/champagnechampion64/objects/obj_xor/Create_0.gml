event_inherited();

self.OnHit = function() {
    self.hp--;
    if (self.hp <= 0) {
        instance_destroy();
    }
};

self.destination = undefined;

self.waypoints = array_create(instance_number(obj_waypoint));
for (var i = 0, n = instance_number(obj_waypoint); i < n; i++) {
    self.waypoints[i] = instance_find(obj_waypoint, i);
}

self.waypoint_countdown = 0;
self.throwing_countdown = 0;
self.throwing_base_countdown = 0;

self.ThrowSnowball = function(dir) {
    var throw_speed = 360;
    var balloon_offset = 12;
    var p = 0 - 15;
    var d = dir + random_range(-15, 15);
    instance_create_depth(self.x + balloon_offset * dsin(d), self.y + balloon_offset * dcos(d), 0, obj_snowball, {
        z: 20,
        xspeed:  dcos(d + 5) * dcos(p) * throw_speed,
        yspeed: -dsin(d + 5) * dcos(p) * throw_speed,
        zspeed: -dsin(p) * throw_speed
    });
};
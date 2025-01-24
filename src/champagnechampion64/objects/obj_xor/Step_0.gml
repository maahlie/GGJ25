var dt = game_get_speed(gamespeed_microseconds) / 1000000;

var player_dist = point_distance(self.x, self.y, obj_player.x, obj_player.y);
var player_dir = point_direction(self.x, self.y, obj_player.x, obj_player.y);

var base_dist = point_distance(self.x, self.y, obj_base.x, obj_base.y);
var base_dir = point_direction(self.x, self.y, obj_base.x, obj_base.y);

if (self.throwing_base_countdown > 0) {
    self.direction = base_dir;
    self.throwing_base_countdown -= dt;

    return;
} else {
    var throw_radius = 200;
    if (base_dist < throw_radius) {
        self.throwing_base_countdown = 1;
    }
}

if (self.throwing_countdown > 0) {
    self.direction = player_dir;
    self.throwing_countdown -= dt;
    if (self.throwing_countdown <= 0) {
        self.ThrowSnowball(player_dir);
    }
    return;
} else {
    var throw_radius = 200;
    if (player_dist < throw_radius) {
        self.throwing_countdown = 1;
    }
}

self.waypoint_countdown -= dt;
if (self.waypoint_countdown > 0) return;

self.x += self.xspeed * dt;
self.y += self.yspeed * dt;
self.z += self.zspeed * dt;

var get_next_waypoint = function() {
    array_sort(self.waypoints, function(a, b) {
        var dist_a = point_distance(self.x, self.y, a.x, a.y);
        var dist_b = point_distance(self.x, self.y, b.x, b.y);
        return dist_a - dist_b;
    });
    
    var radius = 120;
    var in_radius = 0;
    for (var i = 0, n = array_length(self.waypoints); i < n; i++) {
        if (point_distance(self.waypoints[i].x, self.waypoints[i].y, self.x, self.y) <= radius) {
            in_radius++;
        }
    }
    
    if (in_radius > 1) {
        return self.waypoints[irandom(in_radius)];
    }
    
    var threshold = 5;
    for (var i = 0, n = array_length(self.waypoints); i < n; i++) {
        if (point_distance(self.waypoints[i].x, self.waypoints[i].y, self.x, self.y) > threshold) {
            return self.waypoints[i];
        }
    }
};

if (!self.destination) {
    self.destination = get_next_waypoint();
}

var dist = point_distance(self.x, self.y, self.destination.x, self.destination.y);
var dir = point_direction(self.x, self.y, self.destination.x, self.destination.y);
var target_speed = 48;

if (dist <= target_speed * dt) {
    self.x = self.destination.x;
    self.y = self.destination.y;
    self.destination = get_next_waypoint();
    self.waypoint_countdown = random_range(1, 3);
    return;
}

self.speed = 48;
self.direction = dir;
self.xspeed = self.hspeed;
self.yspeed = self.vspeed;
self.speed = 0;
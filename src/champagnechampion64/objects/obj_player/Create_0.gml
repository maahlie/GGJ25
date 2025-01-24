self.pitch = 0;
self.z = 0;
self.max_speed = 120;

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
self.vertex_format = vertex_format_end();

var load_vbuff = function(filename, format) {
    var buffer = buffer_load(filename);
    var vb = vertex_create_buffer_from_buffer(buffer, format);
    vertex_freeze(vb);
    buffer_delete(buffer);
    return vb;
};

self.vb_floor = load_vbuff("floor.vbuff", self.vertex_format);
self.vb_block = load_vbuff("block.vbuff", self.vertex_format);
self.vb_balloon = load_vbuff("balloon.vbuff", self.vertex_format);
self.vb_particle = load_vbuff("water_blob.vbuff", self.vertex_format);
self.vb_xor = load_vbuff("xor.vbuff", self.vertex_format);
self.vb_spawner = load_vbuff("spawner.vbuff", self.vertex_format);
self.vb_snowball = load_vbuff("snowball.vbuff", self.vertex_format);
self.vb_sunflower = load_vbuff("sunflower.vbuff", self.vertex_format);

self.vb_lucas = load_vbuff("spacman.vbuff", self.vertex_format);

application_surface_draw_enable(false);

self.mouselock = true;
self.snowmen_remaining = 50;

self.Spawn = function() {
    static spawner_list = undefined;
    static last_spawner = 0;
    
    if (spawner_list == undefined) {
        spawner_list = array_create(instance_number(obj_spawner));
        for (var i = 0, n = instance_number(obj_spawner); i < n; i++) {
            spawner_list[i] = instance_find(obj_spawner, i);
        }
    }
    
    with (spawner_list[last_spawner]) {
        instance_create_depth(self.x, self.y, 0, obj_xor, {
        });
    }
    last_spawner++;
    last_spawner %= array_length(spawner_list);
    
    self.snowmen_remaining--;
    
    if (self.snowmen_remaining > 0) {
        time_source_reconfigure(self.timer,
            time_source_get_period(self.timer) * 0.99,
            time_source_get_units(self.timer),
            self.Spawn,
            [],
            self.snowmen_remaining,
        );
        time_source_start(self.timer);
    } else {
        time_source_stop(self.timer);
        time_source_destroy(self.timer);
    }
};

self.timer = time_source_create(time_source_game, 4, time_source_units_seconds, self.Spawn, [], 50);
time_source_start(self.timer);

self.ThrowBalloon = function() {
    var throw_speed = 360;
    var balloon_offset = 12;
    var p = self.pitch - 15;
    var d = self.direction;
    instance_create_depth(self.x + balloon_offset * dsin(d), self.y + balloon_offset * dcos(d), 0, obj_water_balloon, {
        z: 16,
        xspeed:  dcos(d + 5) * dcos(p) * throw_speed,
        yspeed: -dsin(d + 5) * dcos(p) * throw_speed,
        zspeed: -dsin(p) * throw_speed
    });
};

self.OnSnowball = function() {
    self.hp--;
    
    if (self.hp <= 0) {
        game_restart();
    }
};

self.has_won = false;

with (obj_xor) {
    instance_destroy();
}
with (obj_snowball) {
    instance_destroy();
}
with (obj_water_balloon) {
    instance_destroy();
}
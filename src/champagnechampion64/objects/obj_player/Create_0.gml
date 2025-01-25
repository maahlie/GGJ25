global.convo=false;
global.gameover = false;

self.pitch = 0;
self.z = 0;
self.max_speed = 120;

cursspr = 0

invertedlol = false

dx = 0;
dy = 0;

cursx = 240;
cursy = 135;

cursdx = 0;
cursdy = 0;

canint = false;
points = 0;

self.suspicion=0;
maxsus=100;

curspressed = false
convotime = 0;
maxconvotime = 500;

mistcolor = #f6ca9f

overstart=360
overtime = 360

peopltalk = audio_play_sound(snd_people,0,true)



global.textoptions = [
	["Hey I haven't\nseen you around\nthe office have I?",
	"I was invited\nby the wife",
	"I work\nin waste\nmanagement",
	"I've been\non paid leave\nfor 6 months",
	"Where the\nhell am I?",
	0,1,4,15]
]

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

self.vb_npc[0] = load_vbuff("mannetje.vbuff", self.vertex_format);
self.vb_npc[1] = load_vbuff("dame.vbuff", self.vertex_format);

self.vb_plate = load_vbuff("baseplate.vbuff", self.vertex_format);
self.vb_drink = load_vbuff("champagne_glass_4b_2.vbuff", self.vertex_format);
self.vb_table = load_vbuff("tafel_rond.vbuff", self.vertex_format);

self.vb_muur = load_vbuff("muur_3ramen.vbuff", self.vertex_format);
self.vb_muurdeur = load_vbuff("muur_2ramen_deur.vbuff", self.vertex_format);

application_surface_draw_enable(false);

self.mouselock = true;
self.snowmen_remaining = 50;


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
global.convo=false;
global.gameover = false;

self.pitch = 10;
self.z = 500;
self.max_speed = 120;

cursspr = 0

invertedlol = false

winefr = 0

dx = 0;
dy = 0;

cursx = 240;
cursy = 135;

cursdx = 0;
cursdy = 0;

mistcolor = #000000


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

self.vb_decor = load_vbuff("Intro_3D_scene.vbuff", self.vertex_format);

application_surface_draw_enable(false);

self.mouselock = true;
self.snowmen_remaining = 50;

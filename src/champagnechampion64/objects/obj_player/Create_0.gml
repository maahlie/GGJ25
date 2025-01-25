global.convo=false;
global.gameover = false;

self.pitch = 0;
self.z = 0;
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

interactcount = 13;
currentint = 0;

t=0;

global.textoptions = [
	["Hey I haven't\nseen you around\nthe office have I?",
	"I was invited\nby the wife.",
	"I work\nin waste\nmanagement.",
	"I've been\non paid leave\nfor 6 months.",
	"Where the\nhell am I?",
	0,5,10,15],
	["Do you work here?\nget dressed then!",
	"Sorry sir was\njust getting\nto it.",
	"I was just\nleaving.",
	"I work for you!",
	"*unzips pants*",
	0,5,10,20],
	["Oh hi, what's your department?",
	"Uhh Housekeeping.",
	"Depends,\nwhat's yours?",
	"I gotta return\nsome videotapes.",
	" I'm the Boss.",
	0,5,10,16],
	["Hi, how are you?",
	"I'm great,\nhow are you?",
	" Better now,\nhaha!",
	"Five more\nglasses and i'll\nbe okay.",
	"Well,\nmy hemorrhoids are\nacting up.",
	0,5,10,15],
	["How's the wife?",
	"Never better!",
	"We've hit\na rough patch.",
	"I'm so alone.",
	"She took\nthe kids.",
	0,5,10,20],
	["You look rough buddy.",
	"Forgot to\nshave haha.",
	"It's a\nnew trend.",
	"You don't\nlook too good\neither.",
	"I can make\nyou look\neven worse.",
	0,5,10,21],
	["Are you supposed to be here?",
	"I was invited,\nactually.",
	"Is this\nnot my local\nwalmart?",
	"I don't know,\nare you?",
	"You are\nnot God, OR\nmy father.",
	0,5,11,19],
	["Lovely music, don't you think?",
	"Exquisite!",
	"It reminds me\nof something...",
	"Who made\nthis garbage?",
	"I'm deaf actually so I can't hear it.",
	0,5,10,19],
	["What's your name?",
	"Ernesto.",
	"Tell me yours first hihi.",
	"Uhh, Champagno...\nuhhh, Tables.",
	"None of your business.",
	0,5,10,20],
	["How long have you\nbeen working here?",
	"5 years.",
	"Started yesterday.",
	"Longer than you\nprobably.",
	"Way too long\noh Lord\nrelease me.",
	0,5,10,19],
	["Are you enjoying\nthe drinks?",
	"Very much!",
	"As long as\nit gets me\nwasted!",
	"Better than\nwarm Landerbräu\nI suppose.",
	"I already stole\nsome actually,\nso yes.",
	0,5,10,20],
	["Nice party, right!",
	"I am enjoying\nmyself greatly!",
	"I should have\n mixed this\nIRN BRU.",
	"It's alright,\nI'm pretty\nfaded.",
	"I'd have left\nalready if it wasn't\nfor the drinks.",
	0,5,10,20],
	["Jeez, what's that smell?",
	"I don't smell\nanything",
	"No clue.",
	"Whoever smelled\nit dealt it!",
	"I live under\na bridge what do\nyou expect.",
	0,5,10,20],
	["",
	"",
	"",
	"",
	"",
	0,5,10,20],
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
global.convo=false;
global.gameover = false;

self.pitch = 0;
self.z = 0;
self.max_speed = 120;

cursspr = 0

invertedlol = false

winefr = 0

popped = false

dx = 0;
dy = 0;

cursx = 240;
cursy = 135;

fovxmod = 0//-window_get_width() / window_get_height()
fovymod = 0//-60

t=0;

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

interactcount = 34;
currentint = 0;



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
	"I'm deaf actually\nso I can't hear it.",
	0,5,10,19],
	["What's your name?",
	"Ernesto.",
	"Tell me yours\nfirst hihi.",
	"Uhh, Champagno...\nuhhh, Tables.",
	"None of your \nbusiness.",
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
	["Crazy meeting last week huh?",
	"Yes, positively\nbonkers.",
	"Yes I was there\nfor sure, crazy.",
	"Think I missed\nthat one.",
	"God i love\ndrinkign.",
	0,5,10,20],
		["Are you even with this company?",
	"I'm a\nplus one.",
	"I gotta\ngo pee.",
	"Probably.",
	"Mind your\nbusiness, elitist.",
	0,5,10,20],
		["How did you get in?",
	"I'm a\nplus one.",
	"Through the\nfront door\nofcourse, haha.",
	"Thanks to\nmy boyish charm\nand good looks.",
	"I don't know,\nyou gonna\nfinish that?",
	0,5,10,20],
		["Hey, you doing alright?",
	"I'm great,\nthank you.",
	"I could use\nanother drink.",
	"I wish i was\nquaffing champagne\nright now.",
	"I'm doing\nabout as good\nas you look.",
	0,5,10,20],
			["Nice room, don't you think?",
	"It's\ngorgeous.",
	"I'd like\nto live\nhere.",
	"Would look\nbetter with\nsome strippers.",
	"Better than\nmy cardboard\nbox.",
	0,5,10,20],
			["What ho, old chap!\nLovely weather eh?",
	"Phenomenal\nweather indeed\nold bean.",
	"Magnificorient\nfor sure.",
	"We're indoors,\nyou dolt!",
	"I'll show you\nsome weather...\nIN MY PANTS!\nWait no.",
	0,5,10,20],
			["Have you heard of the\nscandal involving three members\nof the board?",
	"Oh yes,\ndreadful situation\nall around.",
	"Some say Jerry\nfrom accounting\nwas behind\nit all.",
	"Can't say I have.",
	"I masterminded\nthe whole\nthing!",
	0,5,10,20],
				["Oh I recognize you!\nYou're Dirk's nephew aren't you?\nHow's the old dingus anyway?",
	"Oh he's still\ncrazy about his\npostage stamp\ncollection,\nyou know how\nhe is.",
	"He's uhh,\ndoing alright all things\nconsidered.",
	"He died.",
	"I KILLED HIM!!!",
	0,5,10,20],
				["Penny for your thoughts?",
	"I was just\nthinking of our\nbusiness strategy\nfor the next\nfiscal quarter.",
	"Oh uh... not thinking\nof anything\nin particular.",
	"I'm thinking about\nthose wonderful glass\ntubes filled with\ngolden liquid that\nsparkles like the sun...",
	"Did you know\nSol Badguy is\nthe Guilty Gear?",
	0,5,10,20],
				["Have you tried the\nhors d'oeuvres? They're simply\nout of this world!",
	"Yes i tried them!\nThe cook did\na wonderful job.",
	"Yeah.",
	"I'm more\ninterested in the booze\nto be honest...",
	"What did you\nsay about\nmy mother??",
	0,5,10,20],
				["Haven't I seen you around\nthe watercooler before?",
	"Oh yes I\nthink we've met\nonce or twice,\nhow are you\ndoing?",
	"I work at\na different department,\ncouldn't have\nbeen me.",
	"They should try\nfilling those with\nchampage don't\nyou think?",
	"Shat in one once\nyou know. The boss was pissed,\nor should I say,\nPOOPED AHAH",
	0,5,10,20],
				["Have you seen\nmy champagne glass?\nI was certain it was on the table\na moment ago!",
	"I just saw the\nbutlerwalk off with it,\nI'll go fetch\nhim for you.",
	"Oh sorry, wasn't\npaying much\nattention myself.",
	"I uhh-\nit wasn't me.",
	"*burp* urrgghhfff...\nMmmm good champagne\nin my belly.",
	0,5,10,20],
					["A toast,\nto Jerry from accounting!",
	"To our dear\nfriend and colleague!",
	"To Jerry!",
	"To uhh\nGerald yeah.",
	"A toast\nto my ass\ndude. Heh.",
	0,5,10,20],
					["Such a lovely time we're having,\ndon't you agree?",
	"Absolutely. Things\nare just dandy!",
	"Pwoah it's\nalright.",
	"I sure am\nhaving a great\ntime... Hehehe.",
	"MY MIND BURNS\nWITH IMAGES FROM\nBEYOND RRRAAAAHHHHHH",
	0,5,10,20],
					["Are you alright?\nYou look a bit green\naround the gills.",
	"Just my natural\ncomplexion, I'm fine\nI assure you.",
	"It's a little\nhot in here\nis all...",
	"I think I need to\nget to the bathroom,\nexcuse me...",
	"I'M GONNA SHIT!!!\nRIGHT HERE,\nRIGHT NOW!!!",
	0,5,10,20],
					["Ah Jenkins there you are.\nFetch me some champagne?\nI've already had my third glass,\nohoho.",
	"At once sir.",
	"I'm afraid you've\nmistaken me for\nsomeone else.",
	"Don't mind if\nI polish off the\nnext three!",
	"I'm not Jenkins\nyou crazed dolt.\nFetch your own.",
	0,5,10,20],
					["..and it was around this time that I spied Stella\nin the garden with that blackguard\nDastardly Dunky, and I walked up and said my piece,\nyes indeed! I said my piece don't you know,\nsuch things have no place\nin civilized society...",
	"*smile and nod*",
	"Mhm. Yeah for sure.",
	"*snore loudly*",
	"BLAHBLAHBLAH DO YOU\nEVER STOP\nTALKING?!",
	0,5,10,20],
						["What's your favorite condiment?\nMine's mustard!",
	"Mustard? Great\nchoice honestly.",
	"I'm more of a\nmayonnaise man\npersonally.",
	"I just slather my\nhot dogs with whatever's\non hand to\nbe honest.",
	"It is my personal\nconviction that all mustard\nlovers deserve death!",
	0,5,10,20],
						["Say,\ndo you think they've got caviar\nat this party? Such a refined\ndish mm yes indeed.",
	"Ah yes, caviar!\nThe most exquisite\nof dishes!",
	"Ah yes, caviar!\nThe most delectable\nof dishes!",
	"Ah yes, caviar!\nThe most mediocre\nof dishes!",
	"Ah yes, caviar!\nThe most heinous\nof dishes!",
	0,5,10,20],
						["Such wonderful music at this party!\nPerhaps the musician was inspired\nby Beethoven or maybe Bach.",
	"Hmm Beethoven for\nsure, it exudes an\nair of his later works.",
	"Yeah Bach for\nsure dude.",
	"Haven't heard of either.\nThey power metal bands\nor something?",
	"Gesundheit!",
	0,5,10,20],
						["Ohh my stocks are\ndown in the dumps!\nMy entire fortune gone!",
	"Binky Incorporated\nis about to release\ntheir new BinkyPad.\nSeems like a\ngood bet to recoup\nyour losses.",
	"So sorry to\nhear that.",
	"Shoulda invested in\nthe champagne\ncompany...",
	"Cheers to that!",
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
self.vb_npc[2] = load_vbuff("mannetje_bolhoed.vbuff", self.vertex_format);
self.vb_npc[3] = load_vbuff("mannetje_fez.vbuff", self.vertex_format);

self.vb_plate = load_vbuff("baseplate.vbuff", self.vertex_format);
self.vb_drink = load_vbuff("champagne_glass_4b_2.vbuff", self.vertex_format);
self.vb_table = load_vbuff("tafel_rond.vbuff", self.vertex_format);

self.vb_muur = load_vbuff("muur_3ramen.vbuff", self.vertex_format);
self.vb_muurdeur = load_vbuff("muur_2ramen_deur.vbuff", self.vertex_format);
self.vb_luchter = load_vbuff("kroonluchter.vbuff", self.vertex_format);

self.vb_bubble = load_vbuff("bubbleplane.vbuff", self.vertex_format);

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
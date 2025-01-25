/// @description Insert description here
// You can write your code in this editor

var ran = irandom(3)
var fac = 1
		bub0 = instance_create_depth(100,100,-99999,obj_bubble);
		bub0.txt = global.textoptions[0,(1+ran)%4+1];
		bub0.val = global.textoptions[0,(5+ran)%4+5];
		bub0.dx = fac * random_range(-0.5,0.5)
		bub0.dy = fac * random_range(-0.5,0.5)
		
		bub1 = instance_create_depth(380,100,-99999,obj_bubble);
		bub1.txt = global.textoptions[0,(2+ran)%4+1];
		bub1.val = global.textoptions[0,(6+ran)%4+5];
		bub1.dx = fac * random_range(-0.5,0.5)
		bub1.dy = fac * random_range(-0.5,0.5)
		
		bub2 = instance_create_depth(100,200,-99999,obj_bubble);
		bub2.txt = global.textoptions[0,(3+ran)%4+1];
		bub2.val = global.textoptions[0,(7+ran)%4+5];
		bub2.dx = fac * random_range(-0.5,0.5)
		bub2.dy = fac * random_range(-0.5,0.5)
		
		bub3 = instance_create_depth(380,200,-99999,obj_bubble);
		bub3.txt = global.textoptions[0,(4+ran)%4+1];
		bub3.val = global.textoptions[0,(8+ran)%4+5]//+ran)%4+5];
		bub3.dx = fac * random_range(-0.5,0.5)
		bub3.dy = fac * random_range(-0.5,0.5)
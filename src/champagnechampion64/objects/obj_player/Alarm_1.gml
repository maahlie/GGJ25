/// @description Insert description here
// You can write your code in this editor
		bub0 = instance_create_depth(100,100,-99999,obj_bubble);
		bub0.txt = global.textoptions[0,1];
		bub0.val = global.textoptions[0,5];
		bub0.dx = -1
		bub0.dy = -0.5
		
		bub1 = instance_create_depth(380,100,-99999,obj_bubble);
		bub1.txt = global.textoptions[0,2];
		bub1.val = global.textoptions[0,6];
		bub1.dx = -0.5
		bub1.dy = -1
		
		bub2 = instance_create_depth(100,200,-99999,obj_bubble);
		bub2.txt = global.textoptions[0,3];
		bub2.val = global.textoptions[0,7];
		bub2.dx = 0.5
		bub2.dy = -1
		
		bub3 = instance_create_depth(380,200,-99999,obj_bubble);
		bub3.txt = global.textoptions[0,4];
		bub3.val = global.textoptions[0,8];
		bub3.dx = 1
		bub3.dy = -0.5
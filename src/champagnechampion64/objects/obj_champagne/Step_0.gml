/// @description Insert description here
// You can write your code in this editor

var bub = instance_create_layer(x,y,"Instances_1",obj_bubparticle)
bub.z = z+15
bub.dx = random_range(-0.5,0.5)
bub.dy = random_range(-0.5,0.5)
bub.dz = random_range(3,4)
bub.alarm[0] = random_range(10,14)
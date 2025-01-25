/// @description Insert description here
// You can write your code in this editor
var t = current_time / 2;

matrix_set(matrix_world, matrix_build(self.x, self.y, self.z, 0, 0, self.direction+90, 0.1, 0.1, 0.1));
vertex_submit(obj_player.vb_npc[look], pr_trianglelist, -1);
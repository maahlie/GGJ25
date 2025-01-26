/// @description Insert description here
// You can write your code in this editor
matrix_set(matrix_world, matrix_build(self.x, self.y, self.z+15.5, 0, 0, self.direction, 0.002, 0.002, 0.002));
vertex_submit(obj_player.vb_bubble, pr_trianglelist, -1);
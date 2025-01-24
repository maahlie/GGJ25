var t = current_time / 2;

matrix_set(matrix_world, matrix_build(self.x, self.y, self.z, 0, 0, self.direction+90, 5, 5, 5));
vertex_submit(obj_player.vb_lucas, pr_trianglelist, -1);
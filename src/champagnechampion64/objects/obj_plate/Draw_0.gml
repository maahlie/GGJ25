matrix_set(matrix_world, matrix_build(self.x, self.y, self.z-2, 0, 0, 0, 10, 10, 10));
vertex_submit(obj_player.vb_plate, pr_trianglelist, -1);

matrix_set(matrix_world, matrix_build(self.x, self.y, self.z+144, 0, 0, 0, 10, 10, 10));
vertex_submit(obj_player.vb_plate, pr_trianglelist, -1);
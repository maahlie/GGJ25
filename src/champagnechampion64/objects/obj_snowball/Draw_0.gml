var t = current_time / 2;

matrix_set(matrix_world, matrix_build(self.x, self.y, self.z, t * self.xf, t * self.yf, t * self.zf, 1, 1, 1));
shader_set_uniform_f(shader_get_uniform(shd_world, "u_Color"), self.r, self.g, self.b);
vertex_submit(obj_player.vb_snowball, pr_trianglelist, -1);
shader_set_uniform_f(shader_get_uniform(shd_world, "u_Color"), 1, 1, 1);
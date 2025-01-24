for (var i = 0, n = array_length(self.sunflowers); i < n; i++) {
    var data = self.sunflowers[i];
    matrix_set(matrix_world, matrix_build(data.x, data.y, 0, 0, 0, -45, data.scale, data.scale, data.scale));
    shader_set_uniform_f(shader_get_uniform(shd_world, "u_Color"), 1, 1, 1);
    vertex_submit(obj_player.vb_sunflower, pr_trianglelist, -1);
}
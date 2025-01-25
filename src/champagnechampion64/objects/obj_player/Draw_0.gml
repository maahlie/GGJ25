draw_clear(mistcolor);

var xto = self.x + dcos(self.direction) * dcos(self.pitch);
var yto = self.y - dsin(self.direction) * dcos(self.pitch);
var zto = self.z - dsin(self.pitch) + 32;
var xfrom = self.x;
var yfrom = self.y;
var zfrom = self.z + 32;

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

var view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
var proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 10000);
var camera = camera_get_active();
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

shader_set(shd_world);
shader_set_uniform_f(shader_get_uniform(shd_world, "u_Color"), 1, 1, 1);
shader_set_uniform_f(shader_get_uniform(shd_world, "u_LightDirection"), 1, 1, -1);
shader_set_uniform_f(shader_get_uniform(shd_world, "u_FogColor"), colour_get_red(mistcolor) / 255, colour_get_green(mistcolor) / 255, colour_get_blue(mistcolor) / 255);
shader_set_uniform_f(shader_get_uniform(shd_world, "u_FogDistance"), 1500);
shader_set_uniform_f(shader_get_uniform(shd_world, "u_FogStrength"), 0.5);

matrix_set(matrix_world, matrix_build(self.x, self.y, 0, 0, 0, 0, 1, 1, 1));
//vertex_submit(self.vb_floor, pr_trianglelist, sprite_get_texture(spr_grass, 0));

with (obj_renderable) event_perform(ev_draw, 0);

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);

matrix_set(matrix_world, matrix_build_identity());

shader_reset();
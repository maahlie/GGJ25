/// @description Insert description here
// You can write your code in this editor

window_mouse_set(window_get_width() / 2, window_get_height() / 2);

global.left_pressed = keyboard_check_pressed(ord("A")) | gamepad_button_check_pressed(0, gp_padl);
global.right_pressed = keyboard_check_pressed(ord("D")) | gamepad_button_check_pressed(0, gp_padr);
global.up_pressed = keyboard_check_pressed(ord("W")) | gamepad_button_check_pressed(0, gp_padu);
global.down_pressed = keyboard_check_pressed(ord("S")) | gamepad_button_check_pressed(0, gp_padd);

global.a_pressed = keyboard_check_pressed(ord("E")) | gamepad_button_check_pressed(0, gp_face1);
global.b_pressed = keyboard_check_pressed(vk_space) | gamepad_button_check_pressed(0, gp_face2);
global.start_pressed = keyboard_check_pressed(vk_escape) | gamepad_button_check_pressed(0, gp_start);

global.left_hold = keyboard_check(ord("A")) | gamepad_button_check(0, gp_padl);
global.right_hold = keyboard_check(ord("D")) | gamepad_button_check(0, gp_padr);
global.up_hold = keyboard_check(ord("W")) | gamepad_button_check(0, gp_padu);
global.down_hold = keyboard_check(ord("S")) | gamepad_button_check(0, gp_padd);

global.a_hold = keyboard_check(ord("E")) | gamepad_button_check(0, gp_face1);
global.b_hold = keyboard_check(vk_space) | gamepad_button_check(0, gp_face2);
global.start_hold = keyboard_check(vk_escape) | gamepad_button_check(0, gp_start);

global.cursordx = -gamepad_axis_value(0, gp_axislh)*3 - (window_mouse_get_x() - window_get_width() / 2) / 10;
global.cursordy = gamepad_axis_value(0, gp_axislv)*3 + (window_mouse_get_y() - window_get_height() / 2) / 10;

if keyboard_check_pressed(vk_f11)
{
	if window_get_fullscreen() == true
	{
		window_set_fullscreen(false)
	}
	else
	{
		window_set_fullscreen(true)
	}
}
var dt = game_get_speed(gamespeed_microseconds) / 1000000;

if (keyboard_check_pressed(vk_tab)) {
    self.mouselock = !self.mouselock;
}

if (!window_has_focus()) return;
if (!self.mouselock) return;

self.x += self.dx
self.y += self.dy
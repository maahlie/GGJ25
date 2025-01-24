event_inherited();

self.xf = random_range(0.25, 1.25);
self.yf = random_range(0.25, 1.25);
self.zf = random_range(0.25, 1.25);

self.zgravity = -320;

var get_balloon_color = function() {
    static hue = 0;
    var val = (hue % 360) / 360 * 255;
    hue += 30;
    return val;
};

self.c = make_colour_hsv(get_balloon_color(), 255, 255);
self.r = colour_get_red(self.c) / 255;
self.g = colour_get_green(self.c) / 255;
self.b = colour_get_blue(self.c) / 255;
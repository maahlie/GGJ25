repeat (irandom_range(10, 25)) {
    var gray = random_range(0.5, 1);
    var inst = instance_create_depth(self.x, self.y, 0, obj_water_particle, {
        z: self.z,
        xspeed: random_range(-80, 80),
        yspeed: random_range(-80, 80),
        zspeed: random_range(-80, 80),
    });
    inst.r = gray;
    inst.g = gray;
    inst.b = gray;
}
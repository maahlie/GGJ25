var sunflower_count = 10;

self.sunflowers = array_create(sunflower_count);

for (var i = 0; i < sunflower_count; i++) {
    self.sunflowers[i] = {
        x: self.x + random_range(-24, 24),
        y: self.y + random_range(-24, 24),
        scale: random_range(0.75, 1.25),
    };
}

self.hp = 10;

self.OnSnowball = function() {
    self.hp--;
    
    if (self.hp <= 0) {
        game_restart();
    }
};

self.OnHit = function() {
    
};
function draw_text_outlined(x, y, str, c, co) {
    draw_text_colour(x + 1, y, str, co, co, co, co, 1);
    draw_text_colour(x - 1, y, str, co, co, co, co, 1);
    draw_text_colour(x, y + 1, str, co, co, co, co, 1);
    draw_text_colour(x, y - 1, str, co, co, co, co, 1);
    draw_text_colour(x + 1, y + 1, str, co, co, co, co, 1);
    draw_text_colour(x - 1, y - 1, str, co, co, co, co, 1);
    draw_text_colour(x - 1, y + 1, str, co, co, co, co, 1);
    draw_text_colour(x - 1, y - 1, str, co, co, co, co, 1);
    draw_text_colour(x, y, str, c, c, c, c, 1);
}
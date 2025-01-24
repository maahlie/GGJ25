function draw_text_outlined(x, y, str, c, co, margin) {
    draw_text_colour(x + margin, y, str, co, co, co, co, 1);
    draw_text_colour(x - margin, y, str, co, co, co, co, 1);
    draw_text_colour(x, y + margin, str, co, co, co, co, 1);
    draw_text_colour(x, y - margin, str, co, co, co, co, 1);
    draw_text_colour(x + margin, y + margin, str, co, co, co, co, 1);
    draw_text_colour(x - margin, y - margin, str, co, co, co, co, 1);
    draw_text_colour(x - margin, y + margin, str, co, co, co, co, 1);
    draw_text_colour(x - margin, y - margin, str, co, co, co, co, 1);
    draw_text_colour(x, y, str, c, c, c, c, 1);
}
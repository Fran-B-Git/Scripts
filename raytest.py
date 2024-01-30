from pyray import *
import os

w = 300
h = 200
init_window(w, h, "Hello")
set_window_position(20,40)
directory = "/home/fran/Pictures"
p = [
    directory + "/" + x
    for x in os.listdir(directory)
    if x.endswith(".png") or x.endswith(".jpg")
]
a = [load_texture_from_image(load_image(x)) for x in p]

i = 0

while not window_should_close():
    if is_key_pressed(KeyboardKey.KEY_RIGHT):
        i = (i + 1) % len(a)
    if is_key_pressed(KeyboardKey.KEY_LEFT):
        i = (i - 1) % len(a)
    if is_key_pressed(KeyboardKey.KEY_ENTER):
        os.system("feh --bg-center " + p[i])
    begin_drawing()
    clear_background(WHITE)
    draw_texture_pro(
        a[i],
        Rectangle(0, 0, a[i].width, a[i].height),
        Rectangle(0, 0, w, h),
        Vector2(0, 0),
        0,
        WHITE,
    )
    end_drawing()
close_window()

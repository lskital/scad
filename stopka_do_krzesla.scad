include <threads.scad>;

height=20;
dia_i=13.9;
dia_o=19;
height_o=3;

metric_thread(dia_i, 4, height, square=false, internal=false, n_starts=4);
cylinder(d=dia_o, h=height_o);

// 1 euro
//d = 23.25;
//t = 2.33;

// 2 euro
d = 25.75;
t = 2.2;


hd = 6;

difference() {
  cylinder(d=d, h=t, center=true);
  cylinder(d=hd, h=t, center=true);
}
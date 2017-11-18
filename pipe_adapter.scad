d1=92;
d2=113;

wall=6;

h1=25;
ht=20;
h2=30;

$fn=50;

module cylinder1() {
difference() {
  cylinder(d=d1, h=h1);
  cylinder(d=d1-wall, h=h1);
}
  
}

module cylinder2() {
  difference() {
  cylinder(d=d2+wall, h=h2);
  cylinder(d=d2, h=h2);
}  
}

module cylindert() {
      difference() {
  cylinder(d1=d2+wall, d2=d1, h=ht);
  cylinder(d1=d2, d2=d1-wall, h=ht);
}  
}

translate([0,0,h2+ht]) cylinder1();
translate([0,0,h2]) cylindert();
cylinder2();
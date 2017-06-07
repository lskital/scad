
//font="Bitstream Vera Sans Bold";
//font="Arial Black";
font="Baskerville:style=Bold";
text_on_flat="ZAIN";
text_size=80;
depth=40;
spacing=0.8;

module the_text() {
linear_extrude(height=depth, convexity=4)
    text(text_on_flat, 
         size=text_size,
         font=font,
         halign="center",
         spacing=spacing);
}

the_text();

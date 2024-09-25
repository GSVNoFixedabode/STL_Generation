import("C:/Users/gsvno/OneDrive/Documents/3DModels/HRO/RoseTag_Blank.stl");

// main code
RoseNameL1 = "Souvenir de la";
RoseNameL2 = "Malmaison";
// Set the height for raising and extrusion
raise_height = 4.8;
extrusion_height = 1.2;
line_width = 14; // Max characters per line

// Textbox parameters
font_size = 5;  // Adjust font size to fit within 14 characters per line
line_spacing = 1.2;  // Adjust spacing between lines

module multiLine(lines, size, spacing){
  union(){
    for (i = [0 : len(lines)-1])
      translate([0 , -i * (size + 2), 0 ]) text(lines[i], size, font = "Liberation Sans", halign = "center", valign = "center", spacing = line_spacing
    );
  }
}


translate([2.5, 3, raise_height]) {
    linear_extrude(height = extrusion_height) {
        multiLine([RoseNameL1, RoseNameL2], font_size, line_spacing);
    }
    
}
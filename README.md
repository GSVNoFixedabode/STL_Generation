This is a workflow to read through a CSV file of names, then per line add text to a 3D model of a plant nametag, then save the STL using the plantname.
CSV file has 2 fields, Line1 and Line2 of the expected tag
Powershell script does the following:
- reads in CSV file
- for each line
- - adds the fields to Line variables, and a concatenated name to a filename variable
  - calls an OpenSCAD script, passing in the Line variables, and sending the output to the Line1_Line2.STL fil
- OpenScad script imports the existing blank STL model of a nametag
- - positions the two lines of text and generates the output STL
 
Note: Blank lines will be 'printed' at this stage rather than centering the text if there's only one line of name text.

This was created when a request for 1000 individual permanent nametags was made. Doing all 1000 by hand was too daunting, so a more efficient workflow written.

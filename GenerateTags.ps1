# Define the path to the CSV file
$csvFilePath = "C:\Users\gsvno\OneDrive\Documents\3DModels\HRO\2LineRoseTags.csv"
#$csvFilePath = "C:\Temp\2LineRoseTags.csv"

# Define the path to the OpenSCAD executable
$openScadPath = "C:\Program Files\OpenSCAD\openscad.exe"

# Define the OpenSCAD script file
$openScadScript = "C:\Users\gsvno\OneDrive\Documents\3DModels\HRO\ScriptTag.scad"

# Read the CSV file
$csvContent = Import-Csv -Path $csvFilePath

# Loop through each row in the CSV
foreach ($row in $csvContent) {
   # Define the output file for each iteration
    $L1= '"\"'+$row.Line1+'\""'
    $L2= '"\"'+$row.Line2+'\""'
    $STL = $row.Line1 + " " + $row.Line2 + ".stl"
    $STL = $STL.Replace(" ","_")
    $outputFile = "C:\Users\gsvno\OneDrive\Documents\3DModels\HRO\$STL"

    # Build the OpenSCAD command line arguments
    $arguments = @(
        "--o", $outputFile,             # Output STL file
        $openScadScript,               # OpenSCAD script file
        "--D", "RoseNameL1=$L1",  # Define variable Line1
        "--D", "RoseNameL2=$L2"    # Define variable Line2
    )

    # Output the command for debugging (optional)
    echo $STL
    Start-Process -FilePath $openScadPath -ArgumentList $arguments -Wait
}
# Function to compare two text files with the option to specify comparison operations.
function Get-FileComparison {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory, HelpMessage = "Enter the the reference object's path.")]
        [string]$fileone,

        [Parameter(Mandatory, HelpMessage = "Enter the the difference object's path.")]
        [string]$filetwo,

        [Parameter(Mandatory, HelpMessage = "Select comparison operator (<= , => , or ==). Leave blank for full comparison.")]
        [AllowEmptyString()]
        [string]$operator
    )

    process {
        if ($operator) {
            Compare-Object -ReferenceObject (Get-Content $fileone) -DifferenceObject (Get-Content $filetwo) -IncludeEqual | Where-Object { $_.SideIndicator -eq "$operator" }
        }
        else {
            Compare-Object -ReferenceObject (Get-Content $fileone) -DifferenceObject (Get-Content $filetwo) -IncludeEqual
        }
    }
}

# Function to trim blank characters before and after items in a specified text file
function Get-TrimmedFile {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory, HelpMessage = "Enter the input file path.")]
        [string]$inputfile,

        [Parameter(Mandatory, HelpMessage = "Enter the output file path. Leave empty to overwrite the input file.")]
        [AllowEmptyString()]
        [string]$outfile
    )
    process {
        if ($outfile=$false) { $outfile = $inputfile }
        $trimfile = Get-Content -Path "$inputfile"
        $trimfile.Trim() > $outfile
    }
}
# text_tools_ps
A collection of some PowerShell functions to interact with text files in various ways.

Currently there are two functions: one for comparing two text files with the specified comparison operator, and one to remove blank space at the start and end of each line in a text file.

`Get-FileComparison` requests the path to two files for comparison. The comparison operator can be specified or left blank to return all operators. Will soon add ValidateSet for this parameter.

`Get-TrimmedFile` requests the path of a single file to trim blank space from the start and end of each line in a text file. If no outfile is specified, the input file will be overwritten.

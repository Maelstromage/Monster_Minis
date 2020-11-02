$minis = Get-Content 'C:\personal\D&D\Miniatures (13).json'
# Regular Expresion finder that was replaced \d[^.+\(\D]
$name = Read-Host "name"
$count = 0

if ($minis -match "^\t\t\t""name"": ""$name."){
    $minis | where{$_ -match "^			""name"": """ -and $_ -match $name}
    [int32]$count = read-host "Count:(enter to not change)"
    if($count -ne 0){
        $minis = $minis -replace "((?<=\t\t\t""name"": ""$name.+\()\d+(?=\)))",$count
    }
        
}


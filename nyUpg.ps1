#En parameter för filen, när man kör filen med ./nyUpg.ps1 5.1
#kommer $upg bli 5.2
param (
   [string]$upg
)
if(!(Test-Path -Path ./$upg )){
    New-Item -Path . -Name $upg -ItemType "directory"
}


if(!(Test-Path -Path ./$upg/"upg_$upg.md" )){
    $Value = @" 
# Uppgift: $upg 
Uppgift sak för uppgift $upg 
"@

New-Item -Path ./$upg -Name "upg_$upg.md" -ItemType "file"
    Write-Output "Skriv uppgifter, separera med space"
    $sub = Read-Host
    Add-Content -Path .\$upg\upg_$upg.md -Value $Value
    foreach ($a in $sub.Split())
    {
        $subb = @"
## $a

"@
        Add-Content -Path .\$upg\upg_$upg.md  -Value $subb
    }
    
}
else{
    Write-Output "antingen finns inte ./$upg eller finns redan ./$upg/upg $upg redan" 
}
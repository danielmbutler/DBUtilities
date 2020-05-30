Function Upload-Lambda($path, $DestinationPath, $Functionname){

$Job = Start-Job -ScriptBlock { 

Compress-Archive -path $path -DestinationPath $DestinationPath -Force; Start-Sleep 10 

}

while($Job.State -eq "Running"){

Write-Host -ForegroundColor Green "zipping up project file....."
Start-Sleep 3

}

cd $path

Write-Host -ForegroundColor Green "uploading to aws....."
aws lambda update-function-code --function-name $Functionname --zip-file fileb://function.zip

}


Export-ModuleMember -Function upload-lambda
function Upload-LambdaFunction($Path, $DestinationPath, $Functionname){
#Compress file

Compress-Archive -Path $Path -DestinationPath $DestinationPath -CompressionLevel Fastest -Force

aws lambda update-function-code --function-name $Functionname --zip-file fileb://$DestinationPath



}

Upload-LambdaFunction -Path C:\temp\connectme\Project\Backend\Description\* -DestinationPath C:\temp\connectme\Project\Backend\Description\function.zip -Functionname ThoughtDescription
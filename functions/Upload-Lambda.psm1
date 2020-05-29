Function Upload-Lambda($path, $DestinationPath, $Functionname){
    
    $pathcheck = Test-Path -Path $DestinationPath
    
    if($pathcheck = $true) {
        Upload-LambdaPathCheck($DestinationPath)
   }

} else {
                
           while (Compress-Archive -path $path -DestinationPath $DestinationPath){
                 Write-Host "compressing project folder"

            }
         
        
        }
      while (aws lambda update-function-code --function-name $Functionname --zip-file fileb://$DestinationPath){
        Write-Host "Uploading to Lambda"
    }
}

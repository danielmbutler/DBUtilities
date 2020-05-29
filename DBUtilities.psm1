

#while output not working on Compress-Archive

<#aws lambda update-function-code --function-name $Functionname --zip-file fileb://$DestinationPath 

requires aws cli please substitute for a different command #>

Function Upload-LambdaPathCheck($path){
        $confirmation = Read-Host "destination file already exists do you want us to update it ? (y/n)"
    
        if($confirmation -eq 'y') {
                
                 while (Compress-Archive -path $path -DestinationPath $DestinationPath -Update){
                 Write-Host "compressing project folder"
                }
        if($confirmation -eq 'n') {
            Write-Host "uploading file with no changes"
            while (Compress-Archive -path $path -DestinationPath $DestinationPath){
            Write-Host "compressing project folder"
                 }
        }
}
}
Export-ModuleMember -Function Upload-LambdaPathCheck 




Function Upload-Lambda($path, $DestinationPath, $Functionname){
    
    $pathcheck = Test-Path -Path $DestinationPath -PathType Leaf
    
    if($pathcheck = $true) {
        Upload-LambdaPathCheck($DestinationPath)
   
   }else {
                
           Compress-Archive -path $path -DestinationPath $DestinationPath -Update
        
        }
      
      
      aws lambda update-function-code --function-name $Functionname --zip-file  fileb://$DestinationPath 

}

Export-ModuleMember -Function upload-lambda
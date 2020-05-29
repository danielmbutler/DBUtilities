function Upload-LambdaPathCheck($path){
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
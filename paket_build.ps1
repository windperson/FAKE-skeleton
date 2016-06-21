$paketBootStrapper = "./.paket/paket.bootstrapper.exe"

if ( ! (Test-Path $paketBootStrapper)){
    echo "Download paket bootstrapper..."
    $url = "http://github.com/fsprojects/Paket/releases/download/3.1.6/paket.bootstrapper.exe"
    try{
        $wc = New-Object System.Net.WebClient
        $wc.UseDefaultCredentials=$true
        $wc.Proxy.Credentials=$wc.Credentials
        $wc.DownloadFile($url,  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($paketBootStrapper))
    }catch{
        echo "Download paket bootstrapper failed."
        echo $Error[0]
        exit 1
    }
}
    
$paketExe = ".paket\paket.exe"

if ( ! (Test-Path $paketExe )){
    echo "Download paket executable..."
    Start-Process ".paket\paket.bootstrapper.exe" -NoNewWindow -Wait -PassThru
    if ($LASTEXITCODE -eq 1 -and ! (Test-Path $paketExe) ) {
        echo "Install paket failed."
        exit $LASTEXITCODE
    }
}

$fakeExe = "packages\FAKE\tools\FAKE.exe"

if ( ! (Test-Path $fakeExe)){
    echo "Restore FAKE executable..."
    Start-Process $paketExe -ArgumentList 'restore' -NoNewWindow -Wait -PassThru
    if ($LASTEXITCODE -eq 1 -and ! (Test-Path $fakeExe) ) {
        echo "Install FAKE failed."
        exit $LASTEXITCODE
    }
} 

$buildProcess = Start-Process $fakeExe $Args -NoNewWindow -Wait -PassThru
$buildProcess.WaitForExit()


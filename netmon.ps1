$TempDir = [System.IO.Path]::GetTempPath()
$url = "http://networklookout.com/dwn/nmemplpro_agent.msi"
$output = $TempDir+"nmemplpro_agent.msi"
$start_time = Get-Date

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
#OR
#Start-BitsTransfer -Source $url -Destination $output -Asynchronous

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

$final= $TempDir + 'nmemplpro_agent.msi'

msiexec /i $final PASSWORD=myAgentPassword /qn

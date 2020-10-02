$url = "http://networklookout.com/dwn/nmemplpro_agent.msi"
$output = "nmemplpro_agent.msi"
$start_time = Get-Date

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
#OR
#Start-BitsTransfer -Source $url -Destination $output -Asynchronous

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

msiexec /i nmemplpro_agent.msi PASSWORD=myAgentPassword /qn

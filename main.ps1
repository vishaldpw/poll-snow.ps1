$SnowInstance = 'dev114585.service-now.com'
$SnowUserName = 'admin'
$SnowPass = 'L2Ia8^IiMd!e'
$ShortDescription = 'reboot'

$SnowPass1 = $SnowPass | ConvertTo-SecureString -AsPlainText -Force
$snowCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $SnowUserName,$SnowPass1
$method = "GET"
$uri = "https://$SnowInstance/api/now/table/change_request?sysparm_query=short_descriptionLIKE$ShortDescription&sysparm_display_value=true"

$response = Invoke-WebRequest -ContentType application/json -Method $method -Uri $uri -Credential $snowCreds|ConvertFrom-Json
$ChangeNumber = $response.result.number
return $ChangeNumber

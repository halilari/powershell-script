import-module activedirectory
Install-Module -Name PSBanner -Scope CurrentUser
Write-Banner "POWERSHELL FUCKING😊" -FontName "Segoe UI Emoji" -FontSize 10
Write-Host "Num Args:" $args.Length;

  if($args[0] -eq '-help')
  {
    Write-Output $args[1]
    Write-Output '-user - - - > User Gather Information'
    Write-Output '-system - - - > System Gather Information'
    Write-Output '-service - - - > Service Gather Information'
    Write-Output '-interfaces - - - > Interfaces Gather Information'
    Write-Output '-schedule - - - > Schedule Gather Information'
    Write-Output '-netstat - - - > Netstat Gather Information'
    Write-Output '-domaininfo - - - > Domaininfo Gather Information'
    Write-Output '-groupinfo- - - > Groupİnfo Gather Information'

  }
  If($args[0] -eq '-system')
  {
    Get-WmiObject -Class Win32_Desktop -ComputerName .
    Get-WmiObject -Class Win32_BIOS -ComputerName .
    Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*
    Get-WmiObject -Class Win32_ComputerSystem -ComputerName . | Select-Object -Property SystemType
    Get-WmiObject -Class Win32_ComputerSystem
    Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName .
    Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName . -Property HotFixID
    Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
    Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property Build*,OSType,ServicePack*
  }
  if($args[0] -eq '-user')
  {
    Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property *user*
    Get-WMIObject -class Win32_ComputerSystem -ComputerName .  | select username
    Get_AD_Users_Logon_History.ps1 -LastLogonOnly -OuOnly
    
   
  }
  if($args[0] -eq '-interfaces')
  {
    if($args[1] -eq '--help')
    {
        Write-Host '  Value         Meaning'
        Write-Host '----------------------------------------'
        Write-Host '|0        |     Disconnected            |'
        Write-Host '|1        |     Connecting              |'
        Write-Host '|2        |     Connected               |'
        Write-Host '|3        |     Disconnecting           |'
        Write-Host '|4        |     Hardware not present    |'
        Write-Host '|5        |     Hardware disabled       |'
        Write-Host '|6        |     Hardware malfunction    |'
        Write-Host '|7        |     Media disconnected      |'
        Write-Host '|8        |     Authenticating          |'
        Write-Host '|9        |     Authentication succeeded|'
        Write-Host '|10       |     Authentication failed   |'
        Write-Host '|11       |     Invalid address         |'
        Write-Host '|12       |     Credentials required    |'
        Write-Host '-----------------------------------------'
    }
    Else
    {
       get-wmiobject win32_networkadapter | select netconnectionid, name, InterfaceIndex, netconnectionstatus
       arp -a 
       route print
    }

  }
  if($args[0] -eq '-schedule')
  {
    schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}
   
  }
  if($args[0] -eq '-netstat')
  {
    netstat -ant
   
  }
  if($args[0] -eq '-services')
  {
    get-process
   
  }
  if($args[0] -eq '-domaininfo')
  {
    Get-ADDomain
   
  }
  if($args[0] -eq '-groupinfo')
  {
    Get-ADGroup -filter
   
  }



# powershell-script

Powershellde bazı komutlar işletim sistemine göre değişiklikler göstermektedir. Bu yüzden her komut Windows 2008 de,2010 da yada 2012 de çalışmayabilir ama çalışmayan komutlar olsa bile diğer komutlar çalışmaya devam eder scriptin çalışmasını tamamen durdurmaz. 
Kullanımı: ./powershell.ps1 -help


-help - - - > Kullanılacak parametreler hakkında bilgi verir.
-system  - -> Sistem hakkında bilgi verir.
-user - - - > Userlar hakkında bilgi verir.
-interfaces - -> Çalışan servisler hakkında bilgi verir.
-interfaces --help - - - > İnterfacelerin durumu hakkında ön bilgi verir.
-schedule - - - > Zamanlanmış görevli gösterir.
-netstat - - - -> Network bağlantılarını listeler.
-services - - -> çalışan processleri gösterir.
-domaininfo - - -> Domain hakkında bilgileri getirir.

-system: Sistem hakkındaki bilgileri getirir. Sistemin adını BIOS adını , Aldığı updateleri , İşlemci Hakkındaki bilgileri , İşletim sistemi hakkında ki bilgileri gösterir:

Get-WmiObject -Class Win32_Desktop -ComputerName .
Get-WmiObject -Class Win32_BIOS -ComputerName .
Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*
Get-WmiObject -Class Win32_ComputerSystem -ComputerName . | Select-Object -Property SystemType
Get-WmiObject -Class Win32_ComputerSystem
Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName .
Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName . -Property HotFixID
Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property Build*,OSType,ServicePack*

-user: Userlar hakkındaki bilgiler:

İşletim sisteminde kaç kullanıcı var ne zaman oturum açmışlar gibi bilgileri getirir.
Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property *user*
Get-WMIObject -class Win32_ComputerSystem -ComputerName .  | select username
Get_AD_Users_Logon_History.ps1 -LastLogonOnly -OuOnly

-interfaces: Sistemdeki interfacelerin durumunu gösterir ayrıca arp tablosunu ve route tablosunu gösterir.

get-wmiobject win32_networkadapter | select netconnectionid, name, InterfaceIndex, netconnectionstatus
arp -a 
route print

-schedule: Sistemdeki zamanlanmış görevleri gösterir.

schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}

-netstat: Sistemin ağ bağlantılarını gösterir.

netstat -ant

-services: Sistemde çalışan processleri gösterir.

get-process

-domaininfo: Domain hakkındaki bilgileri getirir.

## Basic setup for a Windows Deployment Server

### Windows 11 Deployment Kit Fix

```
mkdir C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs
```

Then remove/disable the x86 options for the ISO boot disk creation.

### Configuration files
1. wds.ini contains the necessary settings for an unattended entry.  You will only be prompted which Windows release you wish to install.
2. wds2.ini contains the configuration template for the location, username, password, and the domain.

For reference:
[ Installing and Configuring Microsoft Deployment Toolkit (MDT) 2013 on Windows Server 2012 R2](https://blog.itvce.com/2013/10/27/installing-and-configuring-microsoft-deployment-toolkit-mdt-2013-on-windows-server-2012-r2/)
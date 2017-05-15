C3 Inventory provide's expansive inventory capabilities for organizations looking to inventory and assess their endpoint and server environments. C3 Inventory is a C3 site -- for more information on C3 please see the [C3 Homepage.](http://c3.strawgate.com)

# Inventory Capabilities

## Active Directory

#### Active Directory

Basic information covering the Active Directory domain that endpoints are bound to.

* [Active Directory - Win\Mac (Analysis)](https://bigfix.me/analysis/details/2998539)
 * Errors
 * Group Membership
> This property provides recursive group membership which is especially useful for identifying devices with membership in high-privilege groups
 * Last Query Time
 * NetBIOS Domain Name
 * Organizational Unit


* [Invoke - Active Directory Domain Join - Windows (Fixlet)](https://www.bigfix.me/fixlet/details/22887)
> Provides a secure mechanism to perform remote domain joins in your environment.

### Group Policy

Advanced information covering the current Windows Group Policy applied to the Endpoint. This information is especially useful when troubleshooting Group Policy issues and essentially provides the pieces of a, "Resultant Set of Policy".

* [Group Policy - Windows](https://bigfix.me/analysis/details/2998487)
 * Applied Group Policies
> Lists each applied Group Policy, what OU it's applied to and it's GUID
 * Assigned Software Installations
 * Average Network wait
 * Current AD Site
 * Current AD Domain Controller
 * Enforced Group Policies
 * Extensions with Debug/Tracing
 * Locally Group Policy Settings
> Lists each applied setting registry path and its current value
 * Slow Link Status
 * Startup Scripts
 * Shutdown Scripts


* [Invoke - Group Policy Refresh - Windows](https://www.bigfix.me/fixlet/details/22887)
* [Invoke - Reset Local Group Policy - Windows](https://bigfix.me/fixlet/details/22647)
> Deletes and resets the Local Group Policy store

### Users and Groups

Users and Groups content focuses on providing information related to the current and historical users of the endpoint.

* [Users - Win\Mac](https://bigfix.me/analysis/details/2998277)
 * User's Group Membership
 * Explicit Administrator
 * User Profiles on System
* [Users - Windows](https://bigfix.me/analysis/details/2998479)
 * Drive Mappings
 * Implicit Administrator
 * Last Logged on User
 * Last Logon Time for All Users
* [Groups - Win\Mac](https://bigfix.me/analysis/details/2998549)
 * Groups defined on the system
 * Membership information for common groups


* [Invoke - Add Current User to Administrators - Windows](https://bigfix.me/fixlet/details/21627)
* [Invoke - Add Current User to Remote Desktop Users - Windows](https://bigfix.me/fixlet/details/21627)
* [Invoke - Remove Current User from Administrators - Windows]()
* [Invoke - Remove Current User from Remote Desktop Users - Windows]()

## Applications

### General

* [Applications - Universal](https://bigfix.me/analysis/details/2998404)
 * Currently Running Apps
 * Recently Run Apps
 * Registered Apps

 
* [Applications - Windows](https://bigfix.me/analysis/details/2998455)
 * Installed Apps
 * Silent Uninstall Strings for Installed Apps
 * Startup Apps
 * Uninstall Strings for Installed Apps

### CommVault

* [CommVault - Windows](https://bigfix.me/analysis/details/2998373)
 * Agent Version
 * Backup Target
 * Client Port
 * Installed Packages
 * Last Job Id
 * Last Job Time
 * Service State

### Correlog

* [Correlog - Windows](https://bigfix.me/analysis/details/2998374)
 * Destination Address and Port
 * Encryption Configuration
 * Last Configuration Modification Time
 * Monitored Event Logs
 * Remote Configuration Mode
 * Service State

### Dell Command | Configure

The Dell Command | Configure features of C3-Inventory allow the inventorying and control of bios settings on Dell systems.

* [Dell Command | Configure - Windows](https://bigfix.me/analysis/details/2998535)
 * Auto On
 * BIOS Version
 * Manufacture Date
 * Power Management 
 * Secure Boot State
 * TPM State


* [Config - Dell Command | Configure Wake on Lan - Enable - Windows](https://bigfix.me/fixlet/details/22266)
* [Config - Dell Command | Configure Wake on Lan - Disable - Windows](https://bigfix.me/fixlet/details/22265)
* [Config - Dell Command | Configure Firmware - UEFI with SecureBoot - Windows](https://bigfix.me/fixlet/details/23807)
* [Config - Dell Command | Configure Firmware - UEFI - Windows](https://bigfix.me/fixlet/details/23806)

 
Using Dell Command | Configure requires the following steps to be completed:

1. Install Dell Command | Configure
> The package for Dell Command | Configure is available in the [C3-Patch](../Patch/Index.html) site as Deployment, Updating, and Removal content.
1. Action [Invoke - Dell Command | Configure Probe - Windows](https://bigfix.me/fixlet/details/21345) as a policy action
> The probe [Invoke - Dell Command | Configure Probe - Windows](https://bigfix.me/fixlet/details/21345) should be should be actioned to run an unlimited number of times with a delay of however long you find the age of the data to be acceptable (typically once a day is fine).


### Dell Command | Update

The Dell Command | Update features of C3-Inventory enable updating system drivers as well as the BIOS of a Dell system.

* [Dell Command | Update - Windows](https://bigfix.me/analysis/details/2998377)
 * Application Updates
 * Driver Updates
 * Important Updates
 * Optional Updates
 * Recommended Updates
 * Urgent Updates


* [Invoke - Dell Command | Update Driver Probe - Windows](https://bigfix.me/fixlet/details/21355)
* [Invoke - Dell Command | Update Driver Update - Windows](https://bigfix.me/fixlet/details/21370)
 
Using Dell Command | Update requires the following steps to be completed:

1. Install Dell Command | Update
> The package for Dell Command | Update is available in the [C3-Patch](../Patch/Index.html) site as Deployment, Updating, and Removal content.
1. Action [Invoke - Dell Command | Update Driver Probe - Windows](https://bigfix.me/fixlet/details/21355) as a policy action
> The probe [Invoke - Dell Command | Update Driver Probe - Windows](https://bigfix.me/fixlet/details/21355) should be should be actioned to run an unlimited number of times with a delay of however long you find the age of the data to be acceptable (typically once a day is fine).

Optionally, you can perform updates using Dell Command | Update:

1. Action [Invoke - Dell Command | Update Driver Update - Windows](https://bigfix.me/fixlet/details/21370) 
> This will cause the Dell Command | Update agent to reach out to the internet (bypassing the relay infrastructure) to download available drivers.

### Internet Explorer

* [Internet Explorer - Windows](https://bigfix.me/analysis/details/2998393)
 * Trusted Sites (from Group Policy)

### Java

* [Java - Windows](https://bigfix.me/analysis/details/2998238)
 * x86 Version
 * x64 Version
 * Site Exception Configuration

### NXLog

NXLog is the log forwarder of choice for C3 Inventory. NXLog can be configured and deployed entirely using C3.

* [NXLog - Windows](https://bigfix.me/analysis/details/2998476)
 * Installation Directory
 * Monitored Items
 * Service State
 * Version

* [Config - NXLog CE - Enable Modular Management - Windows](http://bigfix.me/cdb/fixlet/22886)
* [Config - NXLog CE Definition - Environment Variables - Windows](http://bigfix.me/cdb/fixlet/23101)
* [Config - NXLog CE Extension - w3c - Windows](http://bigfix.me/cdb/fixlet/22567)
* [Config - NXLog CE Extension - xm_gelf - Windows](http://bigfix.me/cdb/fixlet/22568)
* [Config - NXLog CE Extension - xm_json - Windows](http://bigfix.me/cdb/fixlet/22569)
* [Config - NXLog CE Extension - xm_syslog - Windows](http://bigfix.me/cdb/fixlet/22570)
* [Config - NXLog CE Input - Application Event Log - Windows](http://bigfix.me/cdb/fixlet/22537)
* [Config - NXLog CE Input - Application Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23081)
* [Config - NXLog CE Input - Applocker AppX Event Log - Windows](http://bigfix.me/cdb/fixlet/22538)
* [Config - NXLog CE Input - Applocker AppX Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/22640)
* [Config - NXLog CE Input - Applocker EXE and DLL Event Log - Windows](http://bigfix.me/cdb/fixlet/22539)
* [Config - NXLog CE Input - Applocker EXE and DLL Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23082)
* [Config - NXLog CE Input - Applocker MSI and Script Event Log - Windows](http://bigfix.me/cdb/fixlet/22540)
* [Config - NXLog CE Input - Applocker MSI and Script Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23083)
* [Config - NXLog CE Input - BigFix Client - Windows](http://bigfix.me/cdb/fixlet/23102)
* [Config - NXLog CE Input - BigFix Relay - Windows](http://bigfix.me/cdb/fixlet/22572)
* [Config - NXLog CE Input - Directory Service - Windows](http://bigfix.me/cdb/fixlet/22543)
* [Config - NXLog CE Input - IIS - Windows](http://bigfix.me/cdb/fixlet/22544)
* [Config - NXLog CE Input - Microsoft Office Alerts Event Log - Windows](http://bigfix.me/cdb/fixlet/23085)
* [Config - NXLog CE Input - NXLog - Windows](http://bigfix.me/cdb/fixlet/23095)
* [Config - NXLog CE Input - Powershell Event Log - Windows](http://bigfix.me/cdb/fixlet/23087)
* [Config - NXLog CE Input - Security Event Log - Windows](http://bigfix.me/cdb/fixlet/22546)
* [Config - NXLog CE Input - Security Event Log Reduced - Windows](http://bigfix.me/cdb/fixlet/23088)
* [Config - NXLog CE Input - System Event Log - Windows](http://bigfix.me/cdb/fixlet/22547)
* [Config - NXLog CE Input - System Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23089)
* [Config - NXLog CE Output - to_gelf - Windows](http://bigfix.me/cdb/fixlet/22660)
* [Config - NXLog CE Output - to_syslog_bsd - Windows](http://bigfix.me/cdb/fixlet/22554)
* [Invoke - Reload NXLog CE Configuration - Windows](http://bigfix.me/cdb/fixlet/22548)
* [Invoke - Reload Stale NXLog CE Configuration - Windows](http://bigfix.me/cdb/fixlet/22549)
* [Invoke - Remove NXLog CE Modular Configuration - Windows](http://bigfix.me/cdb/fixlet/22600)

Using NXLog requires the following steps to be completed:

1. Install NXLog 
> The package for NXLog is available in the [C3-Patch](../Patch/Index.html) site as Deployment, Updating, and Removal content.
1. Build a configuration baseline with the following Component Groups:
  * Refresh on Change
    1. [Invoke - Reload Stale NXLog CE Configuration - Windows](http://bigfix.me/cdb/fixlet/22549)
  * Enable NXLog Modular Management
    1. [Config - NXLog CE - Enable Modular Management - Windows](http://bigfix.me/cdb/fixlet/22886)
  * Define NXLog Environment Variables
    1. [Config - NXLog CE Definition - Environment Variables - Windows](http://bigfix.me/cdb/fixlet/23101)
  * Enable NXLog Extensions
    1. [Config - NXLog CE Extension - w3c - Windows](http://bigfix.me/cdb/fixlet/22567)
    1. [Config - NXLog CE Extension - xm_gelf - Windows](http://bigfix.me/cdb/fixlet/22568)
    1. [Config - NXLog CE Extension - xm_json - Windows](http://bigfix.me/cdb/fixlet/22569)
    1. [Config - NXLog CE Extension - xm_syslog - Windows](http://bigfix.me/cdb/fixlet/22570)
  * Add NXLog Inputs
    1. [Config - NXLog CE Input - Application Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23081)
    1. [Config - NXLog CE Input - Applocker AppX Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/22640)
    1. [Config - NXLog CE Input - Applocker EXE and DLL Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23082)
    1. [Config - NXLog CE Input - Applocker MSI and Script Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23083)
    1. [Config - NXLog CE Input - BigFix Client - Windows](http://bigfix.me/cdb/fixlet/23102)
    1. [Config - NXLog CE Input - BigFix Relay - Windows](http://bigfix.me/cdb/fixlet/22572)
    1. [Config - NXLog CE Input - Directory Service - Windows](http://bigfix.me/cdb/fixlet/22543)
    1. [Config - NXLog CE Input - IIS - Windows](http://bigfix.me/cdb/fixlet/22544)
    1. [Config - NXLog CE Input - Microsoft Office Alerts Event Log - Windows](http://bigfix.me/cdb/fixlet/23085)
    1. [Config - NXLog CE Input - NXLog - Windows](http://bigfix.me/cdb/fixlet/23095)
    1. [Config - NXLog CE Input - Powershell Event Log - Windows](http://bigfix.me/cdb/fixlet/23087)
    1. [Config - NXLog CE Input - Security Event Log Reduced - Windows](http://bigfix.me/cdb/fixlet/23088)
    1. [Config - NXLog CE Input - System Event Log Warnings - Windows](http://bigfix.me/cdb/fixlet/23089)
  * Add NXLog Outputs
	1. [Config - NXLog CE Output - to_gelf - Windows](http://bigfix.me/cdb/fixlet/22660)
	> If you are forwarding to Graylog choose only this one
    1. [Config - NXLog CE Output - to_syslog_bsd - Windows](http://bigfix.me/cdb/fixlet/22554)
	> If you are forwarding to Syslog choose only this one
1. Action your baseline as a policy action
> Your baseline should be should be actioned to run an unlimited number of times with a delay of however long you find the age of the configuration to be acceptable (typically once a day is fine).


### Microsoft IIS

* [Microsoft IIS - Windows](https://bigfix.me/analysis/details/2998511)

### Mirosoft MDT

* [Microsoft Deployment Toolkit - Windows](https://bigfix.me/analysis/details/2998513)

### Microsoft SQL

* [Microsoft SQL - Windows](https://bigfix.me/analysis/details/2998470)

### Microsoft SCCM


* [SCCM - Windows](https://bigfix.me/analysis/details/2998488)

## BIOS

### UEFI

### Secure Boot

### Trusted Platform Module

## Hardware

## Mobile Device Management

### Apple Configuration Profiles

## Monitoring

### Service Monitoring

The Service Monitor features of C3-Inventory enable operators to monitor and remediate critical service failures on their servers and endpoints.

* [Service Monitor - Windows](https://bigfix.me/analysis/details/2998502)
 * Monitored Services
 * Recovered Services
 * Services Failing to Recovered
 * Monitor Blacklist

 
* [Config - Service Monitor - 1E NightWatchman - Windows](http://bigfix.me/cdb/fixlet/22601)
* [Config - Service Monitor - Active Directory Certificate Authority - Windows](http://bigfix.me/cdb/fixlet/22575)
* [Config - Service Monitor - Active Directory Federation Services - Windows](http://bigfix.me/cdb/fixlet/22576)
* [Config - Service Monitor - Add to Blacklist](http://bigfix.me/cdb/fixlet/23090)
* [Config - Service Monitor - Blackboard Learn - Windows](http://bigfix.me/cdb/fixlet/22589)
* [Config - Service Monitor - IBM BigFix Components - Windows](http://bigfix.me/cdb/fixlet/22577)
* [Config - Service Monitor - McAfee ePO Agent - Windows](http://bigfix.me/cdb/fixlet/22590)
* [Config - Service Monitor - Microsoft Applocker - Windows](http://bigfix.me/cdb/fixlet/22591)
* [Config - Service Monitor - Microsoft EMET - Windows](http://bigfix.me/cdb/fixlet/22580)
* [Config - Service Monitor - Microsoft Hyper-V Guest Services - Windows](http://bigfix.me/cdb/fixlet/22592)
* [Config - Service Monitor - Microsoft Hyper-V Host Services - Windows](http://bigfix.me/cdb/fixlet/22602)
* [Config - Service Monitor - Microsoft IIS - Windows](http://bigfix.me/cdb/fixlet/22581)
* [Config - Service Monitor - Microsoft SCCM Agent - Windows](http://bigfix.me/cdb/fixlet/23043)
* [Config - Service Monitor - Microsoft SQL Server - Windows](http://bigfix.me/cdb/fixlet/22594)
* [Config - Service Monitor - Microsoft Skype for Business Services - Windows](http://bigfix.me/cdb/fixlet/22595)
* [Config - Service Monitor - Microsoft Windows Basic Services - Windows](http://bigfix.me/cdb/fixlet/22596)
* [Config - Service Monitor - Microsoft Windows DFS - Windows](http://bigfix.me/cdb/fixlet/22597)
* [Config - Service Monitor - Microsoft Windows DHCP Server - Windows](http://bigfix.me/cdb/fixlet/22598)
* [Config - Service Monitor - Microsoft Windows DNS Server - Windows](http://bigfix.me/cdb/fixlet/22599)
* [Config - Service Monitor - Microsoft Windows SNMP - Windows](http://bigfix.me/cdb/fixlet/22584)
* [Config - Service Monitor - Reset Blacklist](http://bigfix.me/cdb/fixlet/23091)
* [Config - Service Monitor - Set Audit Delay to 10 Minutes - Windows](http://bigfix.me/cdb/fixlet/23035)
* [Config - Service Monitor - Set Audit Delay to 15 Minutes - Windows](http://bigfix.me/cdb/fixlet/23036)
* [Config - Service Monitor - Set Audit Delay to 5 Minutes - Windows](http://bigfix.me/cdb/fixlet/23037)
* [Config - Service Monitor - Set Remediation Delay to 10 Minutes - Windows](http://bigfix.me/cdb/fixlet/23038)
* [Config - Service Monitor - Set Remediation Delay to 15 Minutes - Windows](http://bigfix.me/cdb/fixlet/23039)
* [Config - Service Monitor - Set Remediation Delay to 5 Minutes - Windows](http://bigfix.me/cdb/fixlet/23040)
* [Config - Service Monitor - VMWare Tools - Windows](http://bigfix.me/cdb/fixlet/22585)
* [Invoke - Service Monitor Remediation - Windows](http://bigfix.me/cdb/fixlet/23042)

Using C3 Service Monitor requires the following steps to be completed:

#### Start Monitoring Services

In the C3 Inventory Site are a number of fixlets for monitoring standard services. These Fixlets have relevance to only be applicable on devices that have these services. Simply build a baseline with all relevant "Config - Service Monitor - *" Fixlets and apply to your endpoints.

#### Report on failing Services

To report on failing services you can simply make a web report which checks for results for the property, "Service Monitor - Services Failing to Start - Windows" in the, [Service Monitor - Windows](https://bigfix.me/analysis/details/2998502) analysis. Set this report to email whenever there is a change to the report.

#### Remediate failing Services

You also have the option of automatically remediating failed services. You can do this using [Invoke - Service Monitor Remediation - Windows](http://bigfix.me/cdb/fixlet/23042). This Fixlet has the same relevance as the failing services property and will only be relevant on computers with failing services.

When this Fixlet runs it will attempt to start the service.

You should apply this as a policy action set to re-apply at whatever frequency you would like Service monitor to attempt to start the services (Typically 5-15 minutes).

### Custom Service Monitoring

To designate custom services to monitor you can simply create a client setting: "besservicemonitor-<vendor>-<application>".

This name should be unique for every set of services you want to monitor. The value of this new client setting should be a semi-colon separated list of services to monitor.

For instance, for monitoring Microsoft EMET we would could use ActionScript create a client setting like this:

```
setting "besservicemonitor-microsoft-emet"="EMET_Service" on "{now}" for client
```

We can then use the following relevance to cause computers without this setting to become applicable:

```
not exists values whose (it = "EMET_Service") of settings "besservicemonitor-microsoft-emet" of client

```

And finally we can use the following relevance to make the fixlet only relevant on computers that have the service installed:

```
exists services (substrings separated by ";" of "ccmexec;ConfigMgr Wake-up Proxy")
```

To help simplify and automate this process we have provided a [helper script](https://github.com/strawgate/C3-Inventory/blob/master/Helpers/Monitor-Service.ps1), written in powershell, which prompts you for a friendly service group name and for the list of services and generates/imports a fixlet.

### Customizing Service Monitor

There are three ways to customize service monitor:

1. Adjust the time threshold for Failure (besservicemonitor-setting-audit-delay)
1. Adjust the time threshold for Remediation (besservicemonitor-setting-remediation-delay)
1. Blacklist a service to prevent reporting and remediation (besservicemonitor-setting-blacklist)

The first two two settings adjust how long after startup the Service Monitor should wait before reporting a service failure and before attempting remediation. If these settings are not set, the Service Monitor defaults to waiting for 5 minutes after system startup before reporting on service failure and before attempting remediation.

There are pre-made Fixlets in the C3 Inventory site for setting these values to 5, 10, and 15 minutes.

The final setting is a semi-colon separated list of services to ignore. This causes the service monitor to ignore the blacklisted services and not report them as failing or attempt to remediate them. This is particularly useful if you're pushing service monitor configs as global policy actions but need to exclude a specific service on just a single machine.

### Process Monitoring

In addition to monitoring Services, the Process Monitor features of C3-Inventory enable operators to monitor critical processe failures on their servers and endpoints.

* [Process Monitor - Windows](https://bigfix.me/analysis/details/2998501)
 * Monitored Processes
 * Processes Failing to Recovered
 
You can also monitor processes that do not correspond to a service by activating the Analysis: "Process Monitor - Windows" and configuring processes to monitor using the prefix, "besprocessmonitor-" instead of "besservicemonitor" to make sure that individual processes are running on the system. Process Monitor does not have any capability for performing automatic remediation (just reporting) if a process has failed.

To help simplify and automate this process we have provided a [helper script](https://github.com/strawgate/C3-Inventory/blob/master/Helpers/Monitor-Process.ps1), written in powershell, which prompts you for a friendly process group name and for the list of process and generates/imports a fixlet.

## Network

## Operating System

### Certificate Store

The Certificate Store capabilities of C3 Inventory make auditing Certificates easier.

* [Certificates - Windows](https://bigfix.me/analysis/details/2998390)
 * My Certificates
 * My Certificates Expiring in 30 Days
 * My Certificates Expiring in 7 Days
 * My Certificates Expiring in 1 Day
 * My Expired Certificates
 * Remote Desktop Certificates
 * Trusted Code Signing Certificates
 * Trusted Intermediate Authorities
 * Trusted Publishers
 * Trusted Root Authorities
 * Trusted Root Authorities with Private Keys


* [Invoke - Certificate Store Probe - Windows](http://bigfix.me/cdb/fixlet/24040)

Using the C3 Certificate Store capabilities of C3 Inventory requires the following steps to be completed:

1. Action [Invoke - Certificate Store Probe - Windows](http://bigfix.me/cdb/fixlet/24040) as a policy action
> The probe [Invoke - Certificate Store Probe - Windows](http://bigfix.me/cdb/fixlet/24040) should be should be actioned to run an unlimited number of times with a delay of however long you find the age of the data to be acceptable (typically once a day is fine).

### Launch Daemons/Agents

### Network Shares

### Pagefile

### Pending Restart

### Printers

### Updates

### Scheduled Tasks

### Services

### Pagefile

### Volumes

## Temporary Administrators

The temporary administrator features of C3-Inventory allow the provisioning and automatic removal of administrative rights for end-users using actions or offers. The feature requires the following to be successful:

* [Temporary Administrators - Windows](https://bigfix.me/analysis/details/2998399)
 * Current Temporary Administrators
 * Current Authorized Requestors
 * Expired Temporary Administrators
 * Expired Authorized Requestors
 
 
* [Invoke - Add Current Authorized Requestor to Remote Desktop Users - Windows](http://bigfix.me/cdb/fixlet/22607)
* [Invoke - Add Current Authorized Requestor to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24153)
* [Invoke - Add Current User to Authorized Requestors - Windows](http://bigfix.me/cdb/fixlet/24154)
* [Invoke - Add Current User to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24155)
* [Invoke - Add Permanent Administrators to Authorized Requestors - Windows](http://bigfix.me/cdb/fixlet/24156)
* [Invoke - Convert Permanent Administrators to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24157)
* [Invoke - Convert Permanent Administrators who are Authorized Requestors to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24158)
* [Invoke - Remove Current User from Authorized Requestors - Windows](http://bigfix.me/cdb/fixlet/24159)
* [Invoke - Remove Current User from Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24160)
* [Invoke - Remove Expired Users from Authorized Requestors - Windows](http://bigfix.me/cdb/fixlet/24161)
* [Invoke - Remove Expired Users from Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24162)


Using Temporary Administrative Rights requires the following steps to be completed:

#### Add users to Administrators Group Temporarily

[Invoke - Add Current User to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24155) can be used to grant a user temporary administrative privileges.

This Fixlet has a number of actions available that determine the expiration date and time of the users administrative rights anywhere from 1 hour to 5 days.

#### Offer Temporary Administrative Privileges

By using the [Invoke - Add Current User to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24155) as an offer, you can temporarily grant users administrative rights in a self-service model.

#### Automatically remove expired administrative privileges

Use [Invoke - Remove Expired Users from Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24162) as a policy action to always remove expired users from the administrators group.

This should be actioned to run an unlimited number of times with no delay.

### Authorized Requestors 

#### Using "Authorized Requestors"

Authorized Requestors is a way to limit who can request Temporary Administrator access on an endpoint. The idea is that instead of allowing anyone to request access anywhere, you can designate "Authorized Requestors" on individual endpoints and only those users can request administrative rights on the workstation.

To do this simply use the [Invoke - Add Current User to Authorized Requestors - Windows](http://bigfix.me/cdb/fixlet/24154) Fixlet combined with the [Invoke - Add Current Authorized Requestor to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24153) as an offer! This combination allows you to selectively provide temporary administrative rights to users.

#### Convert "Current Administrators" to "Authorized Requestors"

Where the Authorized Requestor model becomes very powerful is when combined with [Invoke - Add Permanent Administrators to Authorized Requestors - Windows](http://bigfix.me/cdb/fixlet/24156) and [Invoke - Convert Permanent Administrators who are Authorized Requestors to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24158).

The idea here is to convert current administrators to authorized requestors, remove their permanent administrator access and replace it with a timed temporary administrative access (up to 5 days). This allows you to convert permanent administartors to temporary administrators!

### Special Use Cases

#### Reverting Help Desk granted Administrators

One of the most effective ways to use temporary administrator content is to just convert permanent administrators to temporary administrators using: [Invoke - Convert Permanent Administrators to Temporary Administrators - Windows](http://bigfix.me/cdb/fixlet/24157). This allows help desk and other staff to give out Administrative Rights and have them automatically revoked after a certain amount of time. This is particularly useful when deploying new computers.


## Virtualization

### Hyper-V Guest and Host

### VMWare ESXi

# Support

If you're having issues with the content feel free to create issues in the repository or contact me on the BigFix forum.

# Contributing

Feel free to make a pull request with any changes or fixes to the content in this site.

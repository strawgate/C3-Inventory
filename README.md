The goal of C3 Inventory is to provide expansive inventory capabilities for organizations to inventory and assess their endpoint and server environments. For more information on C3 in general please see the [C3 Homepage.](http://c3.strawgate.com)

# Basic Content

* Applications
* Group Policy
* Hardware
* Hyper-V Guest and Host
* Network
* Operating System
* Pagefile
* Pending Restart
* Printer
* Services
* Users
* Trusted Platform Module
* UEFI and Secure Boot
* Users and Groups
* VMWare Guest
* Volumes
* Windows Automatic Repair Fixlets
* WMI Analyses

# Advanced Content

## Certificate Store

The Certificate Store is where Windows stores private and public certificates of various types ranging from machine certificates to trusted root certificates. C3 Inventory allows reporting on the Windows Certificate store with two steps.

1. Invocation of the Certificate Store Probe
1. Enable the Certificates Analysis

#### Invocation of the Certificate Store Probe

There is no native method through WMI or the registry to pull significant certificate store information and as such we have to utilize a probe to obtain this information.

The probe is: **Fixlet: Invoke - Certificate Store Probe - Windows**

This should be actioned to run an unlimited number of times with a delay of however long you find the age of the data to be acceptable (typically once a day is fine).

#### Enable the Certificates Analysis

Enable the **Analysis: Certificates - Windows** to begin collecting data on machines that have run the configuration probe.

## Dell Command | Configure

The Dell Command | Configure features of C3-Inventory allow the inventorying and control of bios settings on Dell systems. The feature requires the following to be successful:

1. Installation of Dell Command | Configure
1. Push configuration probe as a policy action
1. Enable the Dell Command | Configure analyses

#### Installation of Dell Command | Configure

Dell Command | Configure is required for the fixlets and analyses to work as expected. The package for Dell Command | Configure is available in the C3-Patch site as Deployment, Updating, and Removal content.

Deploy Dell Command | Configure to your endpoints as the first step.

#### Push configuration probe as a policy action

In order for the analyses in the next step to begin retrieving data you must push the configuration probe as a policy action.

The probe is: **Fixlet: Invoke - Dell Command | Configure Probe - Windows**

This should be actioned to run an unlimited number of times with a delay of however long you find the age of the data to be acceptable (typically once a day is fine).

#### Enable the Dell Command | Configure analyses

Enable the **Analysis: BIOS - Dell - Windows** to begin collecting data on machines that have run the configuration probe.

## Dell Command | Update

The Dell Command | Update features of C3-Inventory allow the updating of drivers and management applications on Dell systems. The feature includes the following:

1. Installation of Dell Command | Update
1. Dell Command | Update Probe
1. Dell Command | Update Analyses
1. Dell Command | Update Driver Update

#### Installation of Dell Command | Update

Dell Command | Update is required for the fixlets and analyses to work as expected. The package for Dell Command | Update is available in the C3-Patch site as Deployment, Updating, and Removal content.

Deploy Dell Command | Update to your endpoints as the first step.

#### Use the Dell Command | Update Probe

In order for the analyses in the next step to begin retrieving data you must push the configuration probe as a policy action.

The probe is: **Fixlet: Invoke - Dell Command | Update Driver Probe - Windows**

This should be actioned to run an unlimited number of times with a delay of however long you find the age of the data to be acceptable (typically once a week/month is fine).

#### Enable the Dell Command | Update analyses

Enable the **Analysis: Dell Command | Update - Windows** to begin collecting data on machines that have run the Driver probe.

Using this analysis you can review all the different types and severities of available drivers.

#### Use the Dell Command | Update Update Driver

Once you are sure that you are ready to update drivers you can use the Update Driver fixlet to actually run Dell Command | Update. *NOTE:* This bypasses the BigFix relay infrastructure and the endpoints will download driver packages directly from Dell.

The Driver Updater is: **Fixlet: Invoke - Dell Command | Update Driver Update - Windows**

## Service Monitoring

Service Monitoring with C3-Inventory allows organizations to monitor, report, and automatically remediate issues with monitored services. Implementing Service Monitoring can be done using the following steps:

1. Activation of Service Monitor Analysis
2. Identify Services to Monitor
3. Report on Failing Services
4. Remediate Failing Services
5. Customizing Service Monitor
6. Monitoring Processes

Service Monitoring requires the BigFix Agent to identify failing services which only occurs during its evaluation cycle. This means it may be a couple of minutes before a failing service is reported. In addition, if a service is disabled on the device, BES Service Monitor will not report the service as failing.

#### Activation of Service Monitor Analysis

The **Analysis: Service Monitor - Windows** should be activated to provide information the current configuration of the service monitor:

1. Currently monitored Services
1. Currently failing Services
1. Service Failures Count
1. Last Service Failure
1. Uptime Delay for reporting
1. Uptime Delay for remediation

Note: This analysis is only relevant for machines with monitored services currently configured.

#### Identify Services to Monitor

In the C3 Inventory Site are a number of fixlets for monitoring standard services. These Fixlets have relevance to only be applicable on devices that have these services.

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

#### Report on failing Services

To report on failing services you can simply make a web report which checks for results for the property, "Service Monitor - Services Failing to Start - Windows" in the, "Service Monitor - Windows" analysis. Set this report to email whenever there is a change to the report.

#### Remediate failing Services

You also have the option of automatically remediating failed services. You can do this using the, Fixlet: "Invoke - Service Monitor Remediation - Windows". This Fixlet has the same relevance as the failing services property and will only be relevant on computers with failing services.

When this Fixlet runs it will attempt to start the service.

You should apply this as a policy action set to re-apply at whatever frequency you would like Service monitor to attempt to start the services (Typically 5-15 minutes).

#### Customizing Service Monitor

There are three ways to customize service monitor:

1. Adjust the time threshold for Failure (besservicemonitor-setting-audit-delay)
1. Adjust the time threshold for Remediation (besservicemonitor-setting-remediation-delay)
1. Blacklist a service to prevent reporting and remediation (besservicemonitor-setting-blacklist)

The first two two settings adjust how long after startup the Service Monitor should wait before reporting a service failure and before attempting remediation. If these settings are not set, the Service Monitor defaults to waiting for 5 minutes after system startup before reporting on service failure and before attempting remediation.

There are pre-made Fixlets in the C3 Inventory site for setting these values to 5, 10, and 15 minutes.

The final setting is a semi-colon separated list of services to ignore. This causes the service monitor to ignore the blacklisted services and not report them as failing or attempt to remediate them. This is particularly useful if you're pushing service monitor configs as global policy actions but need to exclude a specific service on just a single machine.

#### Monitoring Processes

You can also monitor processes that do not correspond to a service by activating the Analysis: "Process Monitor - Windows" and configuring services to monitor using the prefix, "besprocessmonitor-" instead of "besservicemonitor" to make sure that individual processes are running on the system. Process Monitor does not have any capability for performing automatic remediation (just reporting) if a process has failed.

To help simplify and automate this process we have provided a [helper script](https://github.com/strawgate/C3-Inventory/blob/master/Helpers/Monitor-Process.ps1), written in powershell, which prompts you for a friendly process group name and for the list of process and generates/imports a fixlet.

## Temporary Administrative Rights

The temporary administrator features of C3-Inventory allow the provisioning and automatic removal of administrative rights for end-users using actions or offers. The feature requires the following to be successful:

1. Activation of Temporary Administrators Analysis
1. Add Users to Administrators Group Temporarily
1. Offer Temporary Administrative Rights
1. Automatically remove expired administrative privileges

#### Activation of Temporary Administrators Analysis

The **Analysis: Temporary Administrators - Windows** should be activated to provide information on the current and previous temporary administrators on a machine.

This will provide two properties:

1. Current administrators granted temporary rights
1. Users previously granted temporary rights (and now expired)

#### Add users to Administrators Group Temporarily

The **Fixlet: Invoke - Add Current User to Administrators Temporarily - Windows** can be used to grant a user temporary administrative privileges.

This Fixlet has a number of actions available that determine the expiration date and time of the users administrative rights anywhere from 1 hour to 5 days.

#### Offer Temporary Administrative Privileges

By using the **Fixlet: Invoke - Add Current User to Administrators Temporarily - Windows** as an offer, you can temporarily grant users administrative rights in a self-service model.

#### Automatically remove expired administrative privileges

Use **Fixlet: Invoke - Remove Expired Users from Temporary Administrators- Windows** as a policy action to always remove expired users from the administrators group.

This should be actioned to run an unlimited number of times with no delay.

# Support

If you're having issues with the content feel free to create issues in the repository or contact me on the BigFix forum.

# Contributing

Feel free to make a pull request with any changes or fixes to the content in this site.

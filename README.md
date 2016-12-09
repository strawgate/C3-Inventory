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

Once you are sure that you are ready to update drivers you can use the Update Driver fixlet to actually run Dell Command | Update. *NOTE:* This bypasses the BigFix relay infrastructure and the endpoints will download driver packages directlry from Dell.

The Driver Updater is: **Fixlet: Invoke - Dell Command | Update Driver Update - Windows**

## Service and Process Monitoring

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

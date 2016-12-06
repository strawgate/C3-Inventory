# Read From User
$GroupName = read-host "Process Group Name"

$Processes = read-host "Semi-Colon Separated Process List"

#Prepare Parameters for XML Replacement
$EscapedName = $GroupName.replace(" ","-").ToLower()

$HTMLServiceList = ""
foreach($Process in $Processes.Split(";")){
    $HTMLServiceList += "<LI>"
    $HTMLServiceList += "$Process"
    $HTMLServiceList += "</LI>"
}


$XML = @"
<?xml version="1.0" encoding="UTF-8"?>

<BES xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="BES.xsd">
	<Fixlet>
		<Title>Config - Process Monitor - $GroupName - Universal</Title>
		<Description><![CDATA[<P>Configures the BES Process Monitor to monitor processes.</P>
<P>Specifically, this fixlet configures it to monitor the following processes:</P>
<OL>
$HTMLServiceList
</OL>
<P>For general information or to report issues with C3 Inventory content please visit GitHub here: <A href="https://github.com/strawgate/C3-Inventory">https://github.com/strawgate/C3-Inventory</A></P>]]></Description>
		<Relevance>windows of operating system</Relevance>
		<Relevance>exists Processes (substrings separated by ";" of "$Processes")</Relevance>
		<Relevance>not exists values whose (it = "$Processes") of settings "besprocessmonitor-$EscapedName" of client</Relevance>
		<Category>Process Monitor</Category>
		<Source>Internal</Source>
		<SourceID></SourceID>
		<SourceReleaseDate>2016-10-25</SourceReleaseDate>
		<SourceSeverity></SourceSeverity>
		<CVENames></CVENames>
		<SANSID></SANSID>
		<Domain>BESC</Domain>
		<DefaultAction ID="Action1">
			<Description>
				<PreLink>Click </PreLink>
				<Link>here</Link>
				<PostLink> to deploy this action.</PostLink>
			</Description>
			<ActionScript MIMEType="application/x-Fixlet-Windows-Shell">setting "besprocessmonitor-$EscapedName"="$Processes" on "{now}" for client</ActionScript>
		</DefaultAction>
	</Fixlet>
</BES>
"@

$XML > "$PSScriptRoot\Config - Process Monitor - $GroupName - Universal.bes"

invoke-item "$PSScriptRoot\Config - Process Monitor - $GroupName - Universal.bes" 
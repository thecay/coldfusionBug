<cfsavecontent variable="sampleJSON">
{
	"EODDATA":{
			"distributionHub":"USEWR1",
			"manifestId":532329470614213923001,
			"packages": 	[	{"packageid": 12345678},
						{"packageid": 12345678},
						{"packageid": 12345678},
						{"packageid": 12345678}
					]
	          }
}												
</cfsavecontent>

<cfset consumedJson = #DeserializeJSON(sampleJSON)# />
<cfset jsontext = replacenocase(sampleJSON, """", "", "ALL") />	
<cfset manifestIDLocation = 0 />

<!---	Find desired field's position	--->
<cfoutput>
<cfloop from="1" to="#ListLen(jsontext,",,:,],[,{,}")#" index="x">
	<cfif #trim(ListGetat(jsontext,val(x),",,:,],[,{,}"))# eq "manifestid" >
		<cfset manifestIDLocation = #x# + 1 />
	</cfif>
</cfloop>
</cfoutput>	

<!---	Alternate way of finding your desired field's position if trim formatting is not required	--->
<!---	<cfset manifestIDLocation = #ListFindNoCase(jsontext,"manifestId",",,:,],[,{,}")# />	--->

<cfset ourManifestID = #ListGetat(jsontext,val(manifestIDLocation),",,:,],[,{,}")# />	

<cfoutput>
	Raw data we expect: 532329470614213923001 <br>
	Data returned from DeserializeJSON() Function: #consumedJson.eoddata.manifestID# <br>
	Data returned after text manipulation: #ourManifestID# <br>
</cfoutput>	





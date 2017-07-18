<cfset request.header_text = request.WorkoutObj.getHomepageHeaderText()>

<cfoutput>
	#request.header_text#
</cfoutput>
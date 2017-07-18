
<cfswitch expression="#url.page#">
	<cfdefaultcase>
		<cfinclude template="/view/globals/header.cfm">
		<cfinclude template="/view/home.cfm">
		<cfinclude template="/view/globals/footer.cfm">
	</cfdefaultcase>
</cfswitch>
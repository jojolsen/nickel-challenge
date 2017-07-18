<cfcomponent output="false">
	<cffunction name="getEnvironment" returntype="string" access="public">
		
		<cfreturn LCase('local')>
	</cffunction>

	<cffunction name="isLocal" returntype="string" access="public">
		
		<cfreturn getEnvironment() EQ 'local'>
	</cffunction>

	<cffunction name="isDevelopment" returntype="string" access="public">
		
		<cfreturn getEnvironment() EQ 'development'>
	</cffunction>

	<cffunction name="isProduction" returntype="string" access="public">
		
		<cfreturn getEnvironment() EQ 'production'>
	</cffunction>

	<cffunction name="isDebug" returntype="string" access="public">
		
		<cfreturn Application.debug>
	</cffunction>

	<cffunction name="getEnvironmentVariables" returntype="struct" access="public">
		
		<cfset var environmentVariables = {
			DefaultEmailSender : "jdunham@webstaurantstore.com"
			, APIKey : "D3v4P1K3y!"
			, DSN : "MyDSN"
		}>

		<cfreturn environmentVariables>
	</cffunction>

	<cffunction name="getName" returntype="string" access="public">
		
		<cfreturn 'FizzleSite_v2_LOCAL'>
	</cffunction>
</cfcomponent>
<cfcomponent output="no">
	<cfset This.Name = getName()>

	<!--- Disable session management... --->
	<cfset This.SessionManagement	= "false">
	<cfset This.ScriptProtect		= "">		<!--- Protect from XSS Attacks --->

	<cffunction name="onApplicationStart">
		<cfset Application.InitTime					= Now()>
		<cfset Application.Name						= This.name>
		<cfset Application.SitePages				= {}>
		<cfset Application.Cache					= {}>
		<cfset Application.Environment				= getEnvironmentObj().getEnvironment()>
		<cfset Application.Debug					= !(getEnvironmentObj().isProduction())>

		<cfset structAppend(Application, getEnvironmentObj().getEnvironmentVariables())>
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfargument type="string" name="targetPage" required="true" />
		<cfparam name="url.page" default="home" />

		<cfset checkAppRestart()>
		<cfset checkDebug()>
		<cfset checkPageUpdate()>

		<cfset request.WorkoutObj = createObject('component', 'component.Workout')>
		<cfset request.EnvironmentObj = getEnvironmentObj()>
	</cffunction>
	
	<cffunction name="onError">
		<cfargument name="Exception" required="yes"/>
		<cfargument type="string" name="EventName" required="yes" />
		
		<h2>ERRORS:</h2>
		<cfdump var="#arguments#">
	</cffunction>

	<cffunction name="getName" returntype="string" access="private">
		
		<cfreturn getEnvironmentObj().getName()>
	</cffunction>

	<cffunction name="getEnvironmentObj" returntype="component" access="private">
		
		<cfif !structKeyExists(request, 'EnvironmentObj')>
			<cfset request.EnvironmentObj = createObject('component', 'component.Environment')>
		</cfif>

		<cfreturn request.EnvironmentObj>
	</cffunction>

	<cffunction name="restartApp" returntype="void" access="private">

		<cfset StructClear(Application)>
		<cfset onApplicationStart()>
	</cffunction>

	<cffunction name="checkAppRestart" returntype="void" access="private">

		<cfif structKeyExists(url, "AppInit") and url.AppInit>
			<cfset restartApp()>
		</cfif>
	</cffunction>

	<cffunction name="checkDebug" returntype="void" access="private">

		<cfif structKeyExists(url, "debug")>
			<cfif url.debug>
				<cfset Application.debug = true>
			<cfelse>
				<cfset Application.debug = false>
			</cfif>
		</cfif>
	</cffunction>

	<cffunction name="checkPageUpdate" returntype="void" access="private">

		<cfif structKeyExists(url, 'updatePages') AND url.updatePages>
			<cfset Application.SitePages = {}>
		</cfif>
	</cffunction>
</cfcomponent>
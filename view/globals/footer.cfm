
<script type="text/javascript" src="/lib/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/lib/js/site.js"></script>

</body>

<footer>
	<cfif request.EnvironmentObj.isDebug()>
		<cfdump var="#Url#" label="Url" expand="false">
		<cfdump var="#Form#" label="Form" expand="false">
		<cfdump var="#Request#" label="Request" expand="false">
		<cfdump var="#Application#" label="Application" expand="false">
	</cfif>
</footer>

</html>
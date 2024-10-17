<CODEGEN_FILENAME><INTERFACE_NAME>.http</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.7.5</REQUIRES_CODEGEN_VERSION>
<REQUIRES_USERTOKEN>SERVER_PROTOCOL</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVER_NAME</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVER_HTTPS_PORT</REQUIRES_USERTOKEN>
<OPTIONAL_USERTOKEN>TEST_TENANT_ID=1</OPTIONAL_USERTOKEN>

###
### HTTP operations for testing with the Visual Studio REST Client
###
### To execute these tests you will need to first install this extension
### from the Visual Studio marketplace:
###
### https://marketplace.visualstudio.com/items?itemName=MadsKristensen.RestClient
###
### This code was generated by CodeGen, but will not be replaced
### when you regenerate code. If you wish to regenerate the Content
### of this file then delete the file before regenerating.
###

@protocol = <SERVER_PROTOCOL>
@hostname = <SERVER_NAME>
@port = <SERVER_HTTPS_PORT>
@bridgepath = <INTERFACE_NAME>
@tenantid = <TEST_TENANT_ID>
@baseuri = {{protocol}}://{{hostname}}:{{port}}/{{bridgepath}}

<METHOD_LOOP>
###
### <METHOD_NAME>
###

  <IF IN_OR_INOUT>
POST {{baseuri}}
Content-Type:application/json
Accept:application/json
x-tenant-id: {{tenantid}}

{ <PARAMETER_LOOP><IF IN_OR_INOUT>"<PARAMETER_NAME>": <PARAMETER_SAMPLE_DATA><IF MORE_IN_OR_INOUT>,</IF MORE_IN_OR_INOUT></IF IN_OR_INOUT></PARAMETER_LOOP> }

  <ELSE>
GET {{baseuri}}/<METHOD_NAME>
Accept:application/json
x-tenant-id: {{tenantid}}

  </IF>
</METHOD_LOOP>
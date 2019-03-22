# Overview

This version of the "Order to Cash" Salesforce and SAP integration is based upon the Mule 3 version that is documented here: https://github.com/mulesoft-consulting/sfdc-sap-order-cash. However, its been migrated to Mule 4, which has involved some modifications
 
To run the demo it needs to be deployed to CloudHub and any existing demos that are running stopped - so that there are no conflicts when new opportunities are closed. The Linux 86_64 SAP librarie also needs to be copied into the src/app/lib dir before deploying. The libraries can be found here: https://github.com/mulesoft-consulting/sap-libs-internal. Version 3.0.17 is used here

Details about packaging the native lib can be found here: https://support.mulesoft.com/s/article/How-to-prepare-an-application-that-uses-SAP-Connector-to-be-deployed-in-CloudHub-in-Mule-4

To configure the product lookup option or 'Available To Promise' you need to do the following in Salesforce;
1. Select 'Setup' from the top right OrderToCash menu link
2. On the left hand menu under 'App Setup' select the 'Opportunities' > 'Opportunities Product' > 'Buttons and Links' option
3. You can either create or edit the ATP button here, though you shouldn't need to - it should already be setup. The code is here src/main/resources/sfdc/js/atp-button.js
4. This Javascript calls some Salesforce APEX code, atp-check.apex, which is loaded seperately
5. The atp-check.apex is loaded under 'App Setup'. Select the 'App Classes' menu option. There you can add the ATP APEX class. The code is here src/main/resources/sfdc/apex/atp-check.apex
6. Finally if you change the URL for the product REST service in the atp-check.apex script you will need to update the security settings with the new URL. From the 'Setup' menu select 'Administration Setup' select the 'Security Controls' > 'Remote Site Settings' option. Create or edit the 'ordertocashdemo' site and update the remote site URL
   

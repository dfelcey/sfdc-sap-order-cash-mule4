# Overview

This version of the "Order to Cash" Salesforce and SAP integration is based upon the Mule 3 version that is documented here: https://github.com/mulesoft-consulting/sfdc-sap-order-cash. However, its been migrated to Mule 4, which has involved some modifications
 
To run the demo it needs to be deployed to CloudHub and any existing demos that are running stopped - so that there are no conflicts when new opportunities are closed. The Linux 86_64 SAP librarie also needs to be copied into the src/app/lib dir before deploying. The libraries can be found here: https://github.com/mulesoft-consulting/sap-libs-internal. Version 3.0.17 is used here

Details about packaging the native lib can be found here: https://support.mulesoft.com/s/article/How-to-prepare-an-application-that-uses-SAP-Connector-to-be-deployed-in-CloudHub-in-Mule-4
   
To configure the ATP (Available To Promise) Lightning components you need to;

1. Create a Lightning Component in the Salesforce Developer Console (File > New > Lightning Component) and add the 3 components
2. Add the new ATP button to the Opportunity Product page (in the Opportunity Product page, Setup > Edit Page). Then drag the custom component onto the page
3. Update ore create a Remote Setting for the REST URL used in the ATP_Apex_Controller.apex file. Select the Setup menu and in Quick Find search for Remote Settings
 

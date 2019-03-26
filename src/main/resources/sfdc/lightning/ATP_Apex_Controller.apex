public class ATP_Apex_Controller {
     @AuraEnabled
     public static Boolean AtpCheck(Id oppLineItemId) {
        // Query Opp Line Item
        OpportunityLineItem item = [SELECT Id, Availible_Quantity__c, Availible_Quantity_Date__c, ProductCode FROM OpportunityLineItem WHERE Id = :oppLineItemId];

        System.debug('Got item details. Product Code: ' + item.ProductCode);
         
        // Call Web Service
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');
        String url = 'http://ordertocash.cloudhub.io/api/products/' + item.ProductCode;
        req.setEndpoint(url);
        HttpResponse res = http.send(req);
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        Decimal quantity = 0.0;
        if(m.containsKey('availibleQuantity')){
        	quantity = ((Decimal) m.get('availibleQuantity'));
        }else{
        	return False;
        }
        
        System.debug('Quantity: ' + quantity);

        // Update lineitem
    	item.Availible_Quantity__c = quantity;
        item.Availible_Quantity_Date__c = DateTime.now();
        update item;
        
        System.debug('Updated');

        return True;
	}
}
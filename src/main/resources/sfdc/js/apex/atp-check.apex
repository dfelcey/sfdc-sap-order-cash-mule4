global class ATP{ 
    webservice static Decimal atpCheck(String productCode){
        HttpRequest req= new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');
        String url = 'http://ordertocash.cloudhub.io/api/products/'+productCode;
        req.setEndpoint(url);
        HttpResponse res = http.send(req);
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        if(m.containsKey('availibleQuantity')){
        	return((Decimal) m.get('availibleQuantity'));
        }else{
        	return 	-1;
        }
	}
}
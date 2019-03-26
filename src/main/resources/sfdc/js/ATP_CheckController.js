({
	doInit : function(component, event, helper) {
		console.log("doInit Called")
	},
    atpCall: function (component, event, helper) {
        console.log("Atp called.", component.get("v.recordId"));

        var action = component.get("c.AtpCheck");
        action.setParams({
            oppLineItemId : component.get("v.recordId")
        });
        action.setCallback(this, function(a){
        	if(a.getState() === "SUCCESS"){
            	var resultToast = $A.get("e.force:showToast");
        		resultToast.setParams({
                            "title": "Success!",
                            "message": "Refreshed Stock.",
                    		"type": 'success'
                        });
        		resultToast.fire();
                $A.get('e.force:refreshView').fire();
        	}
        });
    	$A.enqueueAction(action);
    }
})
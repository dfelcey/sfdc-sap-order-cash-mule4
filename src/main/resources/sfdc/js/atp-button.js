{
	!requireScript("/soap/ajax/33.0/connection.js")
}
{
	!requireScript("/soap/ajax/33.0/apex.js")
}
// Working on opp line item which is the same as opp product
// Create new opp line item
var opportunityLineItem = new sforce.SObject("OpportunityLineItem");
opportunityLineItem.id = '{!OpportunityLineItem.Id}';

// Need to do this as a query since ProductCode is for some reason not availible
// in the js object.
var result = sforce.connection
		.query("Select ProductCode From OpportunityLineItem where  Id = '{!OpportunityLineItem.Id}' ");
var res = sforce.apex.execute("ATP", "atpCheck", {
	productCode : result.getArray("records")[0].ProductCode
});

if (res == -1) {
	alert('Invalid Material')
} else {

	opportunityLineItem.Availible_Quantity__c = res;
	opportunityLineItem.Availible_Quantity_Date__c = new Date();
	result = sforce.connection.update([ opportunityLineItem ]);
	window.location.reload();
}
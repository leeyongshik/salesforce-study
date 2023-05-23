trigger AccountAddressTrigger on Account (before insert, before update) {
    // Get the list of accounts that have the Match Billing Address checkbox selected
    List<Account> accountsToUpdate = new List<Account>();
    for (Account acc : Trigger.new) {
        if (acc.Match_Billing_Address__c == true) {
            accountsToUpdate.add(acc);
        }
    }
    
    // Update the Shipping Postal Code for each account in the list
    for (Account acc : accountsToUpdate) {
        acc.ShippingPostalCode = acc.BillingPostalCode;
    }
}
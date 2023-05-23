@isTest
public class AccountTriggerTest {
    @testSetup
    static void createTestData() {
        List<Account> accountsToInsert = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            acc.BillingState = 'CA';
            accountsToInsert.add(acc);
        }
        insert accountsToInsert;
    }
    
    @isTest
    static void testAccountTrigger() {
        List<Account> accounts = [SELECT Id, Name, BillingState, ShippingState FROM Account];
        for (Account acc : accounts) {
            System.assertEquals('CA', acc.ShippingState);
        }
    }
}
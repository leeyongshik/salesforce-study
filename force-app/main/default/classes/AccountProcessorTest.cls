@isTest
public class AccountProcessorTest {
    @isTest
    public static void testCountContacts() {
        // Create test data
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            accounts.add(acc);
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 10; i++) {
            Contact con = new Contact(FirstName = 'Test', LastName = 'Contact ' + i, AccountId = accounts[i/2].Id);
            contacts.add(con);
        }
        insert contacts;
        
        // Call the future method
        List<Id> accountIds = new List<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        // Verify the number of contacts updated on the accounts
        List<Account> updatedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :accountIds];
        
        for (Account acc : updatedAccounts) {
            Integer expectedNumOfContacts = [SELECT COUNT() FROM Contact WHERE AccountId = :acc.Id];
            System.assertEquals(expectedNumOfContacts, acc.Number_Of_Contacts__c);
        }
    }
}
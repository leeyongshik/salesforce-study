@IsTest
public class AddPrimaryContactTest {
    @IsTest
    static void testAddPrimaryContact() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name = 'Test Account', BillingState = 'CA'));
        }
        insert accounts;
        
        Contact contact = new Contact(FirstName = 'John', LastName = 'Doe');
        
        Test.startTest();
        AddPrimaryContact job = new AddPrimaryContact(contact, 'CA');
        System.enqueueJob(job);
        Test.stopTest();
        
        Integer expectedContactCount = 50;
        Integer actualContactCount = [SELECT COUNT() FROM Contact WHERE Account.BillingState = 'CA'];
        
        System.assertEquals(expectedContactCount, actualContactCount, 'Contact count is incorrect');
    }
}
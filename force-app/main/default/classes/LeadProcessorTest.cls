@isTest
public class LeadProcessorTest {
    @isTest
    public static void testLeadProcessor() {
        // Insert 200 Lead records
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.FirstName = 'John';
            lead.LastName = 'Doe';
            lead.Company = 'Example Company'; // Set the value for the Company field
            leads.add(lead);
        }
        
        Test.startTest(); // Start test execution context
        
        insert leads;
        
        // Execute LeadProcessor batch class
        LeadProcessor batch = new LeadProcessor();
        Database.executeBatch(batch);
        
        Test.stopTest(); // Stop test execution context
        
        // Verify that all Lead records were updated correctly
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead];
        
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}
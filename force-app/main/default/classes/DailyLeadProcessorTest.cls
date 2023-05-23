@IsTest
public class DailyLeadProcessorTest {
    @IsTest
    static void testDailyLeadProcessor() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(FirstName = 'John', LastName = 'Doe', Company = 'Test Company'));
        }
        insert leads;
        
        Test.startTest();
        String cronExpression = '0 0 0 * * ?'; // Run once daily at midnight
        System.schedule('Daily Lead Processor', cronExpression, new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        
        System.assertEquals(200, updatedLeads.size(), 'Lead records were not updated correctly');
    }
}
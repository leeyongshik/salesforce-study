@isTest
private class TestVerifyDate {
    
    @isTest
    static void testCheckDatesWithin30Days() {
        // Test case where date2 is within 30 days of date1
        Date date1 = Date.today();
        Date date2 = date1.addDays(10);
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result);
    }
    
    @isTest
    static void testCheckDatesEndOfMonth() {
        // Test case where date2 is not within 30 days of date1
        Date date1 = Date.today();
        Date date2 = date1.addDays(40);
        Date result = VerifyDate.CheckDates(date1, date2);
        Integer expectedDay = Date.daysInMonth(date1.year(), date1.month());
        Date expectedDate = Date.newInstance(date1.year(), date1.month(), expectedDay);
        System.assertEquals(expectedDate, result);
    }
    

    
}
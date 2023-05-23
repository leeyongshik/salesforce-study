public class AccountUtils {
    
    // Static method to get all accounts by state abbreviation
    public static List<Account> accountsByState(String stateAbbreviation) {
        List<Account> accounts = new List<Account>();
        if (stateAbbreviation != null && stateAbbreviation.length() == 2) {
            accounts = [SELECT Id, Name FROM Account WHERE BillingState = :stateAbbreviation];
        }
        return accounts;
    }
    
}
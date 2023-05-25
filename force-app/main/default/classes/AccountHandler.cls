public class AccountHandler {
    public static void insertAccount(Integer i){
        List<Account> addAccounts = new List<Account>();
        Integer n = 1;
        
        while(n<=i){
            Account acc = new Account();
            acc.Name = 'Acme Inc ' + n;
            acc.AccountNumber = 'A000'+n;
			addAccounts.add(acc);
            n++;
        }
        
        insert addAccounts;
        
    }

}
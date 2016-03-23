@isTest
private class TestClassManageAccounts 
{
	static testMethod void validateTestClassManageAccounts()
    {
    	Account acc;
		List<Account> AccList = new List<Account>();
	
			for(integer i=1;i<=10;i++)
   			{
   				acc = new account(name='test'+i,site='https://google.com',AccountNumber='1234567890',Website='https://google.com',Fax='12343');
   				AccList.add(acc);
   			}
    	
    }
}
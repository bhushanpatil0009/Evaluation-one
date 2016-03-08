public with sharing class SoqlAndSosl{
	
	public void question()
	{
	 list<Contact> contacts = new list<Contact>();
	 contacts = [SELECT Account.name ,Birthdate , Email FROM Contact ];

		for(Contact con : contacts) 
		{
			system.debug(con);
		}
	}
    
    
    public void question2()
	{
	  Map<id,User> users = new Map<id,User>();
	  list<User> activeUser =[SELECT Username,name FROM User WHERE IsActive=TRUE];
	  for(User u : activeUser  )
	  {
	 
	 	users.put(u.id,u);
	  
	  }
	  
	  system.debug(users);
	}

	public void question3()
	{
	  Map<string,id> accountUser = new Map<string,id>();
	  list<Account> accounts =[SELECT name FROM Account];
	  for(Account acc : accounts)
	  {
	 
	 	accountUser.put(acc.name,acc.id);
	  
	  }
	  
	  system.debug(accountUser);
	}
	public void question3_1()
	{
	  Map<id,Account> accountUser = new Map<id,Account>();
	  list<Account> accounts =[SELECT name FROM Account];
	  for(Account acc : accounts)
	  {
	 
	 	accountUser.put(acc.id,acc);
	  
	  }
	  
	  system.debug(accountUser);
	}
	
	public void question4_1()
	{
	  Map<id,Account> accountUser = new Map<id,Account>();
	  list<Account> accounts =[SELECT name,Enrollment_year__c FROM Account WHERE Enrollment_year__c INCLUDES ('2011','2012')];
	  for(Account acc : accounts)
	  {
	 
	 	accountUser.put(acc.id,acc);
	  
	  }
	  
	  system.debug(accountUser);
	}
	
	public void question4_2()
	{
	  Map<id,Account> accountUser = new Map<id,Account>();
	  list<Account> accounts =[SELECT name,Enrollment_year__c FROM Account WHERE Enrollment_year__c = '2010'];
	  for(Account acc : accounts)
	  {
	 
	 	accountUser.put(acc.id,acc);
	  
	  }
	  
	  system.debug(accountUser);
	}
	
	public void question5()
	{
	  Map<id,Account> accountUser = new Map<id,Account>();
	  list<Account> accounts =[SELECT name,BillingState FROM Account WHERE BillingState != 'kerala;maharashtra' ORDER BY BillingState desc  LIMIT 10000];
	  for(Account acc : accounts)
	  {
	 
	 	accountUser.put(acc.id,acc);
	  
	  }
	  
	  system.debug(accountUser);
	}
	
}
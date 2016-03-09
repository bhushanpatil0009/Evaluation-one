 public with sharing class ChildToParent {
 	
 	public void question1()
 	{	
 		List<Account> accountToContact = [SELECT Name, (SELECT LastName FROM Contacts) FROM Account WHERE Industry = 'media'];
		system.debug(accountToContact); 	
 	}
 	
	public void question2()
 	{	
 		List<A__c> ac1 = [SELECT Id, name, (select id, name from C__r where name='john') from A__c];
		system.debug(ac1); 	
 	}
	
	public void question3()
 	{	
 		List<Account> accountToContact = [Select Account.Name, (Select Contact.Name From Account.Contacts where name=’John’) from Account];
		system.debug(accountToContact); 	
 	}
 	 	
 	public void question4()
 	{	
 		List<Account> accountToContact = [SELECT Name, (SELECT LastName FROM Contacts) FROM Account WHERE Industry = 'media'];
		system.debug(accountToContact); 	
 	}
 	
    
}
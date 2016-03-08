public with sharing class AdvancedConcept3
{
	public void question3()
	{
	integer count=0;
	string str=null;
	list<Contact> contactlist = new list<Contact>([SELECT Name,Account.name,Accountid FROM contact WHERE Account.name LIKE 'bhushan']);	
	system.debug(contactlist);
	for(contact con: contactlist)
	{
		system.debug(con);
		//str = con.accountid;
		count++;
	}
	account obj  = new account();
	obj.Contact_Count__c = count;
	obj.Id = contactlist[0].Accountid;
	update obj;
	
	}
    
}
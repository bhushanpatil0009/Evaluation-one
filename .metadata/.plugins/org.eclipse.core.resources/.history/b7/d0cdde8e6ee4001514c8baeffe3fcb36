trigger Question1Trigger on Employee__c (after insert, after update, before insert, before update)
{
	
	if(trigger.isBefore && trigger.isinsert)
	{
	  	Employee__c emp = trigger.new;
	 	system.debug(emp);
	}
    if(trigger.isBefore && trigger.isupdate)
	{
	  	Employee__c emp = trigger.old.map;
	    system.debug(emp);
	}
    
    if(trigger.isAfter && trigger.isinsert)
	{
		Employee__c emp = trigger.new.map;
	 	system.debug(emp);
	}
    
    if(trigger.isAfter && trigger.isupdate)
	{
		Employee__c emp = trigger.new.map;
	 	system.debug(emp);
	}
    
}
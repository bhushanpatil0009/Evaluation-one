public with sharing class AdvancedConcept4 {
	
	public void question4()
	{
		
		Set<lead> leadSet = new Set<lead>([SELECT id,name,status FROM lead WHERE Status='Closed - Converted']);	
		system.debug(leadset);
		
		//leadToUpdate = [SELECT id,name FROM lead WHERE Status='won' LIMIT 1];
		for(lead leadtoconvert : leadSet)
		{
		leadtoconvert.Status = 'Open - Not Contacted';
		update leadtoconvert;
		}
		
		Set<lead> leadSetupdated = new Set<lead>([SELECT id,name,status FROM lead WHERE Status='Open - Not Contacted']);	
		system.debug(leadSetupdated);
	}
	
    
}
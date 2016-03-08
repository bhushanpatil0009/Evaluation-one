public with sharing class AggregateFunctions
 {
 	public void question1()
  	{
  		system.debug('Question 1');
   		List<AggregateResult> amountref =new List<AggregateResult>([Select sum(Amount) from Opportunity group by FiscalYear]);
   		Map<integer, List<AggregateResult>> newMap = new Map<integer,List<AggregateResult>>();
   		list<opportunity> cDate = [Select FiscalYear from Opportunity ];
   		newMap.put((cDate.get(1)).FiscalYear, amountref);
  		 system.debug(newMap);
  	}    
  	
  	public void questino2()
  	{
  		system.debug('Question 2');
  		List<AggregateResult> amountref =new List<AggregateResult>([SELECT  count(id) FROM lead GROUP BY leadsource HAVING COUNT(leadsource)>10]);
  		system.debug(amountref);
  	}
  	
  	public void question3()
  	{
  		List<AggregateResult> arLeadByStatusBySource = [select status,leadsource,count(name) from Lead group by status,leadsource];
		List<AggregateResult> arLeadByStatus = [select status from Lead group by status];
		Map<String,Map<String,Integer>> mapLeadByStatusBySource = new Map<String,Map<String,Integer>>{};


		for(AggregateResult eachArrSt:arLeadByStatus)
	 	{
        	Map<String,Integer> innerMap = new Map<String,Integer>{};
    		for(AggregateResult eachAggRes : arLeadByStatusBySource)
    		{
        		if(((String)eachArrSt.get('Status'))==((String)eachAggRes.get('Status')))
        		{
        		innerMap.put((String)eachAggRes.get('LeadSource'),(Integer)eachAggRes.get('expr0'));
        		}
    		}
			 mapLeadByStatusBySource.put((String)eachArrSt.get('Status'),innerMap);
		}
		system.debug(mapLeadByStatusBySource);
  	}
  	
  	public void dmlQ2()
  	{
  	Account[] dAccts = [SELECT  Id, Name FROM Account Where Active__c='No' And CreatedDate = LAST_N_DAYS:90];
	try 
	{
		delete dAccts;
	}
	catch (DmlException e)
	{
	}
  	}
  	
  	
  	public void dmlQ3()
  	{
  		Asset a = new Asset(Line_Item_Id__c='orig86475829299');
		try
		{
			insert(a);
		} 
		catch (DmlException e) 
		{
	
		}
	
		Asset a = new Asset(Line_Item_Id__c='orig86475829299');
		try 
		{
		upsert(a);
		} 
		catch (DmlException e) 
		{
			
		}
	
  	}
}
 
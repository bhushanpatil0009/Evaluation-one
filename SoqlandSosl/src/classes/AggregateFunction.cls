public with sharing class AggregateFunctions
 {
 	public void question1()
  	{
  		system.debug('Question 1');
   		set<AggregateResult> amountref =new set<AggregateResult>([Select sum(Amount),FiscalYear from Opportunity where CloseDate = This_Fiscal_Year And StageName in ('closed won','closed lost') group by FiscalYear ]);
   		map<string , AggregateResult>aggerateMap = new map<string , AggregateResult>();
		

		for(AggregateResult ag : amountref)
   		{
		system.debug( ag.get('FiscalYear'));	
		aggerateMap.put( string.valueOf(ag.get('FiscalYear')), ag);
   		
   		}
		system.debug(aggerateMap);
   		
   				
  	}    
  	
  	public void questino2()
  	{
  		system.debug('Question 2');
  		set<AggregateResult> amountref =new set<AggregateResult>([SELECT  count(id),Name FROM lead GROUP BY leadsource HAVING COUNT(leadsource)>10]);
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
  	public void dmlQ1()
  	{
  		List<Lead> leadList = new List<Lead>();
  		lead leadRef;
  		for(Integer i=0;i<100;i++) 
  		{
      		leadRef = new Lead(Uniquen__c = 201 +i ,LastName='charlie'+i , Company='ST' , 
            status='Open - Not Contacted');
  			leadList.add(leadRef);
  		}
  
 		try
  		{
   			insert leadList;
   		}
   		catch(Exception e)
   		{
  		 e.getMessage();
  		}
  		
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
		List<asset> assetList = new List<Asset>();
		for(integer i=0;i<10;i++)
		{
				Asset a = new Asset(Line_Item_Id__c='orig86475829299');
				assetList.Add(a);  
		}
		
		try 
		{
				
		upsert(assetList);
		} 
		catch (DmlException e) 
		{
			
		}
	
  	}
}
 
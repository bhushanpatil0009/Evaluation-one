public class ConsultsExtensions {

    private string currentid{get;set;}
    public string oppid{get;set;}
    
    public ConsultsExtensions(ApexPages.StandardController stdController) 
    {
        currentid=ApexPages.currentPage().getParameters().get('id');  
        system.debug(currentid);   
    }
    
    public pageReference insertOpportunity() 
    {   
         List<consults__c> objconsults = new List<consults__c>([select Description__c,Expected_Revenue__c,Lead_Source__c,Opportunity_Name__c, Opportunity_Owner__c,Price_Book__r.name,Probability__c,Stage__c,Type__c,name,Account_Name__c,Amount__c,Close_Date__c,Contract__r.id from consults__c where id =:currentid]); 
         system.debug(objconsults);
         opportunity objOpportunity;
         
         for(consults__c c : objconsults)
         {
              objOpportunity = new opportunity();
              objOpportunity.name = c.name; 
              objOpportunity.amount = c.Amount__c; 
              objOpportunity.CloseDate = c.Close_Date__c;
              objOpportunity.Contract = c.Contract__r;
              objOpportunity.Description = c.Description__c;
              objOpportunity.Accountid= c.Account_Name__c; 
              objOpportunity.LeadSource= c.Lead_Source__c;
              objOpportunity.Type= c.Type__c;
              objOpportunity.Probability= c.Probability__c;
              objOpportunity.StageName= c.Stage__c;
              objOpportunity.Pricebook2= c.Price_Book__r;
                 
           // After successful insert, navigate to the opportunities page
           }
           insert objOpportunity;
           oppid = objOpportunity.id;  
         pageReference refAccountPage = new pageReference('/'+oppid);
         return refAccountPage;
      
    }
       
    
}
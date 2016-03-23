public class LeadExtensions {

    private string currentid{get;set;}
    id conid;
    pageReference refConsultPage;
    pageReference refOpportunityPage;
    List<lead> objleads;
    
    //creating objects for converting leads
    Database.LeadConvert lc;
    LeadStatus convertStatus;
    Database.LeadConvertResult lcr; 
 
    public LeadExtensions(ApexPages.StandardController stdController) 
    {
        currentid=ApexPages.currentPage().getParameters().get('id');  
        system.debug(currentid);   
    }
    
    public pageReference insertRecords() 
    {
       objleads = new List<lead>([select name,AnnualRevenue,Convert_to__c,LeadSource,Status,description from lead where id =:currentid]);
       lc = new database.LeadConvert();
       lc.setLeadId(objleads[0].id);
       
       if(objleads[0].Convert_to__c == 'Consult')
       {   
           lc.setDoNotCreateOpportunity(True); //**IMPORTANT METHOD HERE**\         
       }
        
          convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
          lc.setConvertedStatus(convertStatus.MasterLabel);           
          lcr = Database.convertLead(lc);
          System.assert(lcr.isSuccess());
         
       if(objleads[0].Convert_to__c == 'Consult')
       {
           insertConsults();
           return refConsultPage;
       }
       else
       {
           insertOpportunity();
            return refOpportunityPage;  
       }    
    }   
       
     public pageReference insertConsults() 
     {
          Consults__c objConsults;
          objConsults = new Consults__c();
          objConsults.name =  objleads[0].name;
          objConsults.account_name__c = lcr.getaccountid();
          objConsults.Lead_Source__c = objleads[0].LeadSource; 
          objConsults.description__c = objleads[0].Description;
          objConsults.Lead_Source__c = objleads[0].name;
          objConsults.Amount__c = objleads[0].AnnualRevenue;
          objConsults.Expected_Revenue__c = objleads[0].AnnualRevenue;
          objConsults.Close_Date__c = system.today()+30;
          objConsults.Type__c = 'new Customer';
          objConsults.Stage__c = 'Prospecting';
          objConsults.Probability__c = 10;  
          insert objConsults;
          
          system.debug(objConsults);   
          // After successful insert, navigate to the consult page  
          id conid = objConsults.id;
          refConsultPage = new pageReference('https://ap2.salesforce.com/'+conid);
          return refConsultPage;
     }
     
     public pageReference insertOpportunity() 
     {
          opportunity objOpportunity;
          id oppid  = lcr.getOpportunityid();
          opportunity insertedOpportunity = [select id from opportunity where id=: oppid];
    
          insertedOpportunity.name =  objleads[0].name;
          insertedOpportunity.LeadSource = objleads[0].LeadSource; 
          insertedOpportunity.Description = objleads[0].Description;
          insertedOpportunity.Amount = objleads[0].AnnualRevenue;
          insertedOpportunity.CloseDate = system.today()+30;
          insertedOpportunity.Type= 'new Customer';
          insertedOpportunity.StageName= 'Prospecting';
          insertedOpportunity.Probability= 10;  
              
          update insertedOpportunity ;
          system.debug(insertedOpportunity );      
          refOpportunityPage = new pageReference('https://ap2.salesforce.com/'+oppid);
          return refOpportunityPage;  
     }
     
}
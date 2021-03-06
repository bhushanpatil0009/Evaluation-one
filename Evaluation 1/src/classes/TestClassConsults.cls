@isTest
private class TestClassConsults 
{
  static testMethod void validateTestClassConsults()
    {
        list<consults__c> listConsults = new list<consults__c>();
        consults__c consult = new consults__c(name='test',Amount__c=12000,
                                                Close_Date__c=system.today()+30,
                                                Description__c='This is test data',   
                                                Lead_Source__c='web',Stage__c='prospecting');
           
        insert(consult); 
           
        Test.startTest();
      
        PageReference pageRef = Page.consults;
        Test.setCurrentPage(pageRef);
        ApexPages.Standardcontroller sc = new ApexPages.Standardcontroller(consult);
        ApexPages.currentPage().getParameters().put('Id',consult.id);
        
        ConsultsExtensions objExtension = new ConsultsExtensions(new ApexPages.StandardController(consult));
       
        objExtension.insertOpportunity();
        List<Opportunity> listOpportunity = new List<Opportunity>([select id from opportunity]); 
        listOpportunity.size();
        system.assertEquals(1,listOpportunity.size(), 'assert successful'); 
        
        Test.stopTest();
        
    }
}
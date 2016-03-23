@isTest
private class TestClassVFBill
{
    static testMethod void validateTestClassVFBill()
    {
   		Invoice_Statement__c obj_invoive = new Invoice_Statement__c(City__c='jaipur',Company_Name__c='infosys',Email_Address__c='test@gmail.com',
   		Name__c='Bhushan',Phone__c='9898899090',Street_Name__c='NY Street'); 
   		system.debug('value in total before inserting any line item'+obj_invoive.Total_Bill__c);
   		insert obj_invoive;
   		system.debug(obj_invoive);
   		
   		list<Invoice_Statement__c> listInvoice = new list<Invoice_Statement__c>([select id from Invoice_Statement__c where name__c='Bhushan']);
   		Invoice_Statement__c invoiceId = new Invoice_Statement__c();
   		for(Invoice_Statement__c invoice : listInvoice)
   		{
   			invoiceId=invoice;
   		}
   		System.debug(invoiceId.id);
   		
   		list<Line_Item__c> obj_line = new list<Line_Item__c>();
   		Line_Item__c obj;
   		for(integer i=1;i<=2;i++)
   		{
   			obj = new Line_Item__c(Labor__c=100,New_client_Discount__c=100,Price__c=10000,Product_Name__c='Samsung',Service_Fee__c=100,Units__c=2,Invoice_Statement__c=invoiceId.id);
   			obj_line.add(obj);
   		}
   		insert obj_line;
   		system.debug(obj_line);
   		
   		ApexPages.StandardController sc = new ApexPages.standardController(obj_invoive);
   		LineItemExtension objExtension =  new LineItemExtension(sc);
   		list<Line_item__c> lstlabour = objExtension.getListLabor();
   		system.debug(lstlabour); 
   		
   		List<line_item__c> testline = new List<line_item__c>([select id,Invoice_Statement__c,Price__c,New_client_Discount__c  from line_item__c]);
   		for(line_item__c objTestLine : testline )
   		{
   			system.assertEquals(invoiceId.id, objTestLine.Invoice_Statement__c, 'error!!!!');
   			system.assertEquals(obj.price__C, objTestLine.price__C, 'Price Dose not match');
   			system.assertEquals(obj.New_client_Discount__c, objTestLine.New_client_Discount__c, 'Discount Dose not match');
   		}
   		
    }

}
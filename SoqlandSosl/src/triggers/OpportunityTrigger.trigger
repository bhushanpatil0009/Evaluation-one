trigger AccountTrigger on Account (after insert) 
{
    list<Account> Clone = new list<Account>(trigger.new);
    Account newclone = new Account();
    
    for( opportunity temp : Clone)
    {
        if(checkRecursion.runOnce())
        {
            newClone = temp.clone(false,false,true,true);
            insert(newClone);
        }
    }
    
}
	

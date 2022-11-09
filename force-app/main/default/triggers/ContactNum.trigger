trigger ContactNum on Contact (after insert,after update,after delete) {
    Set<Id> relatedId = New Set<Id>();
    if(trigger.isInsert || trigger.isUpdate){
        for(Contact changeCons: Trigger.new){
            relatedId.add(changeCons.AccountId);
        }
    }
        if(trigger.isDelete){
        for(Contact changeCons: Trigger.old){
            relatedId.add(changeCons.AccountId);
        }
    }
   List<Account> realtedAccounts= [Select Callable_Contacts__c, Id,(select Id from contacts where phone!=Null) from Account where Id IN: relatedId];
    for(account acc: realtedAccounts){
        acc.Callable_Contacts__c=acc.contacts.size();
        realtedAccounts.add(acc);
    }
    update realtedAccounts;
}
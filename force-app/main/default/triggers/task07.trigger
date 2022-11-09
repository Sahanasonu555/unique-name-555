trigger task07 on Opportunity (before insert) {
set<Id> setaccId=new Set<id>();
    for(Opportunity op:Trigger.new){
        if(op.Amount !=null){
            setaccId.add(op.AccountId);
        }
    }
    List<Account> listAcc=new List<Account>();
        for(Account acc1:[Select id, Amount1__c from Account where Id in:setaccId]){
            List<Opportunity> oppForAccount= [Select id,Amount,Name FROM Opportunity where AccountId=:acc1.Id ANd Amount !=null order by Amount desc limit 2];
        Decimal amount=0;
        for(Opportunity oppty:oppForAccount){
            amount+=oppty.Amount;
        }
        acc1.Amount1__c=amount;
        listAcc.add(acc1);
    }
    if(listAcc.size()>0){
        update listAcc;
    }
}
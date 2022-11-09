trigger sum on Opportunity (after insert, after update) {
    set<Id>accountId=new set<Id>();
    for(Opportunity opp:trigger.new){
        accountId.add(opp.AccountId);
    }
    Map<String,Decimal>MapaccountToSumOpp=new  Map<String,Decimal>();
    for(Opportunity Opp : [SELECT Id,Amount,AccountId,StageName FROM Opportunity WHERE AccountId=:accountId AND (StageName='Prospecting' OR StageName='Closed Won') ]){
        Decimal OppAmount=0;
        if(Opp.StageName=='Prospecting'){
            if(MapaccountToSumOpp.containskey(Opp.AccountId+'Prospecting')){
                OppAmount= MapaccountToSumOpp.get(Opp.AccountId+'Prospecting');
            }
            MapaccountToSumOpp.put(Opp.AccountId+'Prospecting',Opp.Amount+OppAmount );
        }
        if(Opp.StageName=='Closed Won'){
            if(MapaccountToSumOpp.containskey(Opp.AccountId+'Closed Won')){
                OppAmount= MapaccountToSumOpp.get(Opp.AccountId+'Closed Won');
            }
            MapaccountToSumOpp.put(Opp.AccountId+'Closed/Won',Opp.Amount+OppAmount );
        }
    }
    List<Contact>contacts= new List<Contact>();
    for(Contact cont:[SELECT Id, AccountId FROM Contact WHERE AccountId=:accountId]){
        cont.Prospecting_Oppty_Sum__c= MapaccountToSumOpp.get(cont.AccountId+'Prospecting');
        cont.ClosedWon_Oppty_Sum__c= MapaccountToSumOpp.get(cont.AccountId+'Closed Won');
        contacts.add(cont);
    }
    if(contacts!=null && !contacts.isEmpty()){
        update contacts;
    }
}
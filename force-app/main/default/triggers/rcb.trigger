trigger rcb on Opportunity (before insert){
    for(Opportunity opp:Trigger.new){
        opp.RecordCreatedBy__c=Userinfo.getname();
    }
}
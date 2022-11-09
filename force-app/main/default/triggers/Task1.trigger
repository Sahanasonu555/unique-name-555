trigger Task1 on Opportunity (before insert , before update) {
    if(Trigger.isInsert){
        for (Opportunity o : Trigger.new){
            o.StageName = 'Prospecting';
    }
}
    if(Trigger.isUpdate){
        for (Opportunity opp : Trigger.new) { 
            opp.StageName = 'Need Analysis';
        }
    }
}
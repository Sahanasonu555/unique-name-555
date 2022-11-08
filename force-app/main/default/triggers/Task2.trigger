trigger Task2 on Opportunity (before insert , before update) {
    if(Trigger.isInsert){
        for (Opportunity o : Trigger.new){
            if(o.Amount>100000){
                o.StageName='Immediate Attention Required';
            o.CloseDate=system.today()+3;
        }
            else{
                o.StageName = 'Prospecting';
            }
    }
}
    if(Trigger.isUpdate){
        for (Opportunity opp : Trigger.new) { 
            if(opp.Amount>10000){
                opp.StageName='High Value';
                opp.CloseDate=system.today()+5;
            }
            else{
                 opp.StageName = 'Need Analysis';
            }
        }
    }
}
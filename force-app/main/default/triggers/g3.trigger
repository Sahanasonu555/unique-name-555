trigger g3 on Opportunity (after insert,before update) {
    if(Trigger.isInsert){
        for(Opportunity opp:Trigger.new){
            if(opp.Amount>10000){
                Task ta = new task();
                ta.Subject     = 'Immediate Attention Required High Importance Opportunity created ';
                ta.Description = 'please action ASAP and close the opportunity';
                ta.Priority    = 'High';
                insert ta;
                update ta;
            }
        }
    }
}
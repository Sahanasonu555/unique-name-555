trigger g1 on Opportunity (after insert) {
    if(Trigger.isInsert){
        for(Opportunity opp:Trigger.new){
            Task ta = new task();
            insert ta;
        }
    }
}
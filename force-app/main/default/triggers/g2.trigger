trigger g2 on Opportunity (after insert) {
        for(Opportunity opp:Trigger.new){
            if(opp.Amount>10000){
                Task ta = new task();
                ta.Subject = 'Test';
                insert ta;
            }
        }
    }
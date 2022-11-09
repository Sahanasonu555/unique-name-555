trigger L23 on Opportunity (after insert,before update) {
        for(Opportunity opp:Trigger.new){
            if(opp.Amount>100000 && opp.StageName!='Closed Won'){
                if(Trigger.isInsert){
                    Opportunity oppo=new opportunity();
                    oppo.StageName='Immediate Attention Required';
                    insert oppo;
                OpportunityContactRole ocr = new OpportunityContactRole();
                    ocr.ContactId ='0035g00000e93xtAAA';
                    ocr.OpportunityId = opp.Id;
                    ocr.Role = 'Decision Maker';
                insert ocr;
                    update ocr;
                }
            }
        }
    }
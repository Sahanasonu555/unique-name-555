trigger ocr on Opportunity (before insert,before update,after insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for (Opportunity o : Trigger.new){
            if(o.Amount>100000 && o.StageName!='Closed Won'){
                o.StageName='Immediate Attention Required';
                o.CloseDate=system.today()+3;
            }
        }
    }
                if(Trigger.isAfter && Trigger.isInsert){
                    for(Opportunity o:Trigger.new){
                        if(o.StageName=='Immediate Attention Required'){
                        OpportunityContactRole ocr = new OpportunityContactRole();
                    ocr.ContactId ='0035g00000e93xtAAA';
                    ocr.OpportunityId = o.Id;
                    ocr.Role = 'Decision Maker';
                insert ocr;
                    update ocr;
                        }
                    }
                }
}
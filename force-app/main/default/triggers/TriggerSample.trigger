trigger TriggerSample on Opportunity (before insert,before update,after insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for (Opportunity o : Trigger.new){
            o.RecordCreatedBy__c=Userinfo.getname();
                if(o.Amount>100000 && o.StageName!='Closed Won'){
                    o.StageName='Immediate Attention Required';
                    o.CloseDate=system.today()+3;
                }
        }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        for(Opportunity o:Trigger.new){
            if(o.Amount>10000){
                Task ta = new task();
                ta.Subject     = 'Immediate Attention Required High Importance Opportunity created ';
                ta.Description = 'please action ASAP and close the opportunity';
                ta.Priority    = 'High';
                insert ta;
                update ta;
            }
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
    if(Trigger.isBefore && Trigger.isUpdate){
         for (Opportunity opp : Trigger.new) { 
            if(opp.Amount>10000){
                opp.StageName='High Value';
                opp.CloseDate=system.today()+5;
            }
         }
    }
}
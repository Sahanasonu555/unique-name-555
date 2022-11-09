trigger caseStatusUpdate on Case(after insert) {
    Set<Id>Relatedcons=new Set<Id>();
    Set<Id>RelatedAccs=new Set<Id>();
    for(Case ca: trigger.new){
        Relatedcons.add(ca.ContactId);
        RelatedAccs.add(ca.AccountId);
    }
    List<Case>caselist=[SELECT Id,ContactId,AccountId,Status FROM Case WHERE ContactId=:Relatedcons AND createddate=Today];
    List<Contact>conlist=[SELECT Id,Name,(SELECT Id,Status FROM Cases WHERE createddate=Today ) FROM Contact WHERE Id=:Relatedcons];
    for(Contact con:conlist){
        if(con.Cases.size()>2){
            for(Case cs:caselist){
                if(cs.ContactId==con.Id){
                    cs.Status='Closed';
                }
            }
        }
    }
    List<Account>Acclist = [SELECT Id,Name,(SELECT Id,Status FROM Cases WHERE createddate=Today) FROM Account WHERE Id=:RelatedAccs];
    for(Account Acc:Acclist){
        if(Acc.Cases.size()>3){
            for(Case cs:caselist){
                if(cs.AccountId==Acc.Id){
                    cs.Status='Closed';
                }
            }
        }
    }
    update caselist;
}
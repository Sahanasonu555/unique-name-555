public class Batchapex implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            [SELECT Id, Name, Amount, Account.Name, AccountId FROM Opportunity WHERE CALENDAR_YEAR(CreatedDate)> 2000 AND Amount>2000]
            );
        
    }
        public void execute(Database.BatchableContext bc, list<Opportunity> records){
            System.debug(records);
            List<Opportunity>opplist=new List<Opportunity>();
            for(opportunity eachopp :records)
            {
                eachopp.Name=eachopp.Account.Name+String.valueof(Date.today())+String.valueof(eachopp.Amount);
                //System.debug(eachopp);
                opplist.add(eachopp);
            }
            update opplist;
            System.debug('Opportunity after updates:'+opplist);
            Database.update(opplist);
            
        }
        public void finish(Database.BatchableContext bc){
            System.debug('finished');
        }
    }
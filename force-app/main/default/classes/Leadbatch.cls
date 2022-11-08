public class Leadbatch implements Database.Batchable<sObject> {
    //Mass update the Lead`s phonenumber for all records that were created after year 2000. Copy Mobile phone to Phone field if its null
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            [SELECT Phone, MobilePhone, CreatedDate, LastName, Company FROM Lead WHERE CALENDAR_YEAR(CreatedDate)> 2000 AND MobilePhone!=null]
            );
        
    }
        public void execute(Database.BatchableContext bc, list<Lead> records){
            System.debug(records);
            List<Lead> leadList=new List<Lead>();
            for(Lead le :records)
            {
                if(le.Phone==null){
                le.phone=le.MobilePhone;
                leadList.add(le);
            }
            }
            update leadList;
            System.debug(leadList);
            Database.update(leadList,false);
            
        }
        public void finish(Database.BatchableContext bc){
            System.debug('finished');
        }
    }
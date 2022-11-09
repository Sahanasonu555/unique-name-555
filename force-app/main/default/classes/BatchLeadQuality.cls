public class BatchLeadQuality implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            [SELECT Id,FirstName, LastName, Phone, MobilePhone, Company, Fields_Populated__c, Data_Quality__c, Email, Website, Title FROM Lead]
            );
        
    }
        public void execute(Database.BatchableContext bc, list<Lead> records){
            System.debug(records);
            List<Task> dataTask = new List<Task>();
    Integer i;
    Decimal score;
            List<Lead> Leadlist = new List<Lead>();
    for(Lead l : records){
       i=0;
        score=0;
        if(l.FirstName!=null){
            i+=1;
            score+=20;
           
        }
        if(l.LastName!=null){
            i+=1;
            score+=20;
           
        }
        if(l.Email!=null){
            i+=1;
            score+=25;
          
        }
        if(l.Phone!=null){
            i+=1;
            score+=25;
           
        }
        if(l.Website!=null){
            i+=1;
            score+=10;
            
        }
        if(l.Title!=null){
            i+=1;
            score+=10;
            
        }
            Integer op;
            op=110;
        l.Fields_Populated__c=i;
            l.Data_Quality__c=(score/op)*100;
        Leadlist.add(l);
       
            if(l.Fields_Populated__c>=2){
        if(l.FirstName!=null){
           Task ta = new Task();
            ta.WhoId=l.Id;
            ta.OwnerId='0055g00000FiY7UAAV';
            ta.Subject='Verify the FirstName field';
            dataTask.add(ta);
           
            
        }
        if(l.LastName!=null){
           Task ta = new Task();
            ta.WhoId=l.Id;
            ta.OwnerId='0055g00000FiY7UAAV';
            ta.Subject='Verify the LastName field';
            dataTask.add(ta);
            
        }
        if(l.Email!=null){
           Task ta = new Task();
            ta.WhoId=l.Id;
            ta.OwnerId='0055g00000FiY7UAAV';
            ta.Subject='Verify the Email field';
            dataTask.add(ta);
           
        }
       if(l.Phone!=null){
           Task ta = new Task();
            ta.WhoId=l.Id;
           ta.OwnerId='0055g00000FiY7UAAV';
            ta.Subject='Verify the Phone field';
           dataTask.add(ta);
          
        }
        if(l.Website!=null){
           Task ta = new Task();
            ta.WhoId=l.Id;
            ta.OwnerId='0055g00000FiY7UAAV';
            ta.Subject='Verify the Website field';
            dataTask.add(ta);
            
        }
        if(l.Title!=null){
           Task ta = new Task();
            ta.WhoId=l.Id;
            ta.OwnerId='0055g00000FiY7UAAV';
            ta.Subject='Verify the Title field';
            dataTask.add(ta);
            
        }
    }
}
        insert dataTask;
        update Leadlist;
        System.debug(dataTask);
        System.debug(Leadlist);

        }  
        public void finish(Database.BatchableContext bc){
            System.debug('finished');
        }
    }
//BatchLeadQuality b = new BatchLeadQuality();
//Database.executeBatch(b, 300);


//ScheduleUpdateon BatSch = new ScheduleUpdateon();
//String sch = '00 00 9 14 10 ? 2022';
//String jobID = System.schedule('Update Time at', sch, BatSch);
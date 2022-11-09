trigger FieldCount on Lead (before insert,after insert) {
    List<Task> dataTask = new List<Task>();
    Integer i;
    Decimal score;
    for(Lead l : Trigger.new){
        if(Trigger.isInsert && Trigger.isBefore){
        i=0;
        score=0;
        if(l.FirstName!=null){
            i+=1;
            score+=10;
           
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
            op=100;
        l.Fields_Populated__c=i;
            l.Data_Quality__c=(score/op)*100;
    }
    if(l.Fields_Populated__c>=3 && Trigger.isAfter && Trigger.isInsert){
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
}
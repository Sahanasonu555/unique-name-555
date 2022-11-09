trigger g4 on Task (after insert, before update){
    Opportunity opp=new Opportunity();
    for(Task eachTask:Trigger.new){
        opp = [Select Id,StageName,Amount,Account.OwnerId 
            From Opportunity
            Where Id=:eachTask.whatId];
        if(eachTask.ActivityDate==System.Today() && opp.StageName!='Closed Won' && opp.Amount>100000){
            Task newTask = new Task();
            newTask.Subject = 'Immediate Attention Required: Oppty Not Closed';
            newTask.Description = 'Please action ASAP and close the opportunity';
            newTask.Priority = 'High';
            newTask.OwnerId=opp.Account.OwnerId;
            newTask.whatId=opp.Id;
            insert newTask;
        }
    }
}
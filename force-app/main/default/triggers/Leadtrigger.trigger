trigger Leadtrigger on Lead(before update){
   //Trigger.new is list of all records that are being processed in current transactions
    for(Lead l : Trigger.new){
        l.firstname = l.lastname;    
        // update
    }
}
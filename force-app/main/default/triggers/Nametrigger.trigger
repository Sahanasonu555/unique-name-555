trigger Nametrigger on Lead(before update){
    for(Lead l : Trigger.new){
        if (l.firstname != 'Adam'){
            l.lastname = l.firstname;   
        }
    }
}
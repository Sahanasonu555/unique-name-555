trigger Phonetrigger on Lead (before update) {
    for(Lead l : trigger.new){
        string phonel = l.phone;
            if(phonel.startsWith('0')){
                l.phone = '';
            }
    }
}
trigger Leadsam on Lead (before insert,before update) {
        if(Trigger.isInsert && Trigger.isUpdate){
        for (Lead l : trigger.new){
            string phonel = l.Phone;
            if(phonel.startsWith('0')){
                   l.Phone = '';
               }
        }
}
    if(Trigger.isUpdate){
        for (Lead l : trigger.new){
        if (l.FirstName != 'Adam'){
            l.LastName = l.FirstName;
        }
            if (l.Phone == null){
                l.Phone = l.MobilePhone;
            }
    }
    }
}
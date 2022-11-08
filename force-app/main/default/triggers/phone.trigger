trigger phone on Lead (before insert,before update) {
    for (Lead l : trigger.new){
        if (l.Phone == null){
            l.Phone = l.MobilePhone;
            }
    }
}
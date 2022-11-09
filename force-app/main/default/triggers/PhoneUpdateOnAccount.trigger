trigger PhoneUpdateOnAccount on Account (after update) {
    set<ID> AccountIDset= new set<ID>();
    List<Contact> conListToBeUpdated= new List<Contact>();
    for(Account a: trigger.new){
        AccountIDset.add(a.Id);
    }
    if(trigger.isafter && trigger.isupdate){
        for(Account acc: trigger.new){
                for(contact con:[select id,Phone,MailingCountry,Account.BillingCountry from contact where accountid in :AccountIDset]){
                    if(con.MailingCountry==acc.BillingCountry){
                        con.Phone=acc.Phone;
                        conListToBeUpdated.add(con);
                    }
                }
            }
        }
        update conListToBeUpdated;
    }
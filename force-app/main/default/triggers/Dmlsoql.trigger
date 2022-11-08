trigger Dmlsoql on Account (after insert) {
    List<Account> acc=new List<Account>();
    for(Account acc2 : Trigger.new){
    //Account acc1=[SELECT Id,Name FROM Account WHERE Name Like 'SO%'];
    //System.debug(acc1);
}
}
//[SELECT Id, Name FROM Account WHERE Name Like 'SO%']; 1
//[SELECT Id, LastName FROM Contact WHERE LastName Like '%Smith']; 2
//[SELECT Id, Name FROM Contact WHERE Account.name Like 'TE%']; 3
//[SELECT Amount, CloseDate FROM Opportunity WHERE Amount>1000 OR CloseDate > TODAY]; 4
//[SELECT Id, MAX(Amount) FROM Opportunity WHERE Account.Name  Like 'SO%' OR CloseDate=TODAY group by Id]; 5
//[SELECT Id, Amount, Name FROM Opportunity WHERE Amount!=null order by Name desc limit 1]; 6
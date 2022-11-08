trigger Opportunity on Account (after insert,after update) {
    List<Opportunity> newOppo = new List<Opportunity>();
    for (Account acc :Trigger.new) {
            for (Integer i=1; i<=10; i++)  {
                if (acc.NumberofEmployees > 99) {
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name + Date.today();
                opp.AccountId = acc.Id;
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today()+10;
                newOppo.add(opp);
            }
        }
    }
    insert newOppo;
}
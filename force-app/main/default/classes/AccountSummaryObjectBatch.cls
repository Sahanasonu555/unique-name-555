public class AccountSummaryObjectBatch implements Database.Batchable<sObject>, Database.Stateful{
    Map<String,Account_Summary__c> mapSas = new Map<String,Account_Summary__c>();
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            [Select Id, Name, Industry, (Select Id, Name from Contacts), (SELECT Id, Amount FROM Opportunities) from Account where Industry!=null]
        );
    }
    public void execute(Database.BatchableContext bc, list<Account> records){
        //Set<Id> Ids = new Set<Id>();
        Set<String> Industries = new Set<String>();
        List<Account_Summary__c> ast = new List<Account_Summary__c>();
        //for(Account_Summary__c aso : ast){
           // Ids.add(aso.ExternalId__c);
        //}
        for(Account acc : records){
            Industries.add(acc.Industry);
        }
        for(String ind : Industries){
            Account_Summary__c asp = new Account_Summary__c();
            if(mapSas.containsKey(ind)){
                asp = mapSas.get(ind);
                for(Account acc : records){
                    if(acc.Industry==ind){
                        asp.Account_Records__c=asp.Account_Records__c+1;
                        asp.Contact_Records__c=asp.Contact_Records__c+acc.contacts.size();
                        for(Opportunity opp1 : acc.Opportunities){
                            asp.Sum_of_Opportunity__c=asp.Sum_of_Opportunity__c+opp1.Amount;
                        }
                    }
                }
            }
            else{
                asp.Name= ind+'RRR';
                asp.ExternalId__c=ind+Date.today();
                asp.Account_Industry__c = ind;
                Integer Account = 0;
                Integer Concount = 0;
                Double Opsum = 0;
                for(Account acc : records){
                    if(acc.Industry == ind){
                        Account+=1;
                        Concount+=acc.contacts.size();
                        for(Opportunity opp1 : acc.Opportunities){
                            Opsum+=opp1.Amount;
                        }
                    }  
                }
                asp.Account_Records__c = Account;
                asp.Contact_Records__c = Concount;
                asp.Sum_of_Opportunity__c = Opsum;
                asp.Batch_Date__c=Date.today();
            }
            System.debug(asp);
            mapSas.put(ind,asp);
        }
        //try {
        upsert mapSas.Values() Account_Summary__c.ExternalId__c;
        
        //} catch (DmlException e) {
        //}
        //upsert ast;
        //Database.insert(ast,false);
    }
    public void finish(Database.BatchableContext bc){
        System.debug('finished');
    }
}
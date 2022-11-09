public class AccountDataBatch implements Database.Batchable<sObject> {
   
     public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            [Select Id, Name, Industry, (Select Id, Name from Contacts), (SELECT Id, Amount FROM Opportunities) from Account where Industry!=null]
            );
    }
        public void execute(Database.BatchableContext bc, list<Account> records){
            Set<String> Industries = new Set<String>();
            List<Account_Summary__c> ast = new List<Account_Summary__c>();
            for(Account acc : records){
                Industries.add(acc.Industry);
            }
            for(String ind : Industries){
                Account_Summary__c asp = new Account_Summary__c();
                asp.Name= ind+'Rw';
                Integer Account = 0;
            Integer Concount = 0;
            Double Opsum = 0;
                    asp.Account_Industry__c = ind;
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
                asp.ExternalId__c=ind+Date.today();
                     ast.add(asp);
            }
            try {
    			upsert ast;
				} catch (DmlException e) {
				}
            	//upsert ast;
            //Database.insert(ast,false);
            System.debug(ast);
        }
        public void finish(Database.BatchableContext bc){
            System.debug('finished');
        }
    }
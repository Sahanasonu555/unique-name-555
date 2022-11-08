public with sharing class Accfetch {
@AuraEnabled(Cacheable=true)
public static list<Account> getAccountData(String textkey) {
        textkey = '%' + textkey + '%';
        list<Account> accLst = [SELECT  Id, Name, Industry, Website From Account WHERE Name LIKE :textkey];
        if(accLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return accLst;
    }
}
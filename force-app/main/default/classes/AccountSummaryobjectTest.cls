@isTest
public class AccountSummaryobjectTest {
    @TestSetup
    public static void testBatch() {
        List<Account> newAccount = new List<Account>();
        for (integer i=0 ;  i<=3 ; i++){
            Account accTest = new Account();
            accTest.Name = 'United'+i;
            if(math.mod(i,2)!=0){
                accTest.Industry = 'Apparel';
            }
            else{
                accTest.Industry = 'Finance';
            }
            accTest.Description = 'Football Association';
            newAccount.add(accTest);
        }
        insert newAccount;
        List<Account> a = [Select id,Name,Industry from Account];
        List<Contact>newContact = new List<Contact>();
        for (integer i=0; i<10 ;i++){
            Contact cons = new Contact();
            Opportunity opps = new Opportunity();
            cons.FirstName = i+'string';
            cons.LastName = i+'string';
            cons.AccountId = a[i/5].Id;
            newContact.add(cons);
        }
        insert newContact;
        List<Opportunity> newOpptys = new List<Opportunity>();
        for (Account acc :a) {
            Opportunity oppty           = new Opportunity();
            oppty.Name= acc.Industry+'-'+acc.Name;
            oppty.StageName = 'Prospecting';
            oppty.AccountId = acc.Id;
            if (acc.Industry == 'Apparel') {
                oppty.Amount = 1000;
                oppty.StageName = 'Prospecting';
                oppty.closeDate     = Date.today()+10;
            } else {
                oppty.Amount = 2000;
                oppty.StageName = 'ClosedWon';
                oppty.closeDate     = Date.today()+30;
            }
            newOpptys.add(oppty);
        }
        insert newOpptys;
        List<Account_Summary__c> ast = new List<Account_Summary__c>();
        for(Account_Summary__c asp : ast){
        asp.Account_Industry__c = 'Apparel';
        asp.Account_Records__c = 3 ;
        asp.Contact_Records__c = 10;
        asp.Sum_of_Opportunity__c = 6000;
        asp.Batch_Date__c = Date.today();
        asp.ExternalId__c = 'opi'+ Date.today();
            ast.add(asp);
        }
        insert ast;
    }
    @isTest
    public static void testBatch1(){
        Test.StartTest();
        AccountSummaryObjectBatch obj = new AccountSummaryObjectBatch();
        ID batchprocessid = Database.executeBatch(obj );
        Test.StopTest();
        List<Account_Summary__c> asp = ([SELECT Account_Industry__c, ExternalId__c, Account_Records__c, Contact_Records__c, Sum_of_Opportunity__c FROM Account_Summary__c]);
        System.assertEquals(5, asp[0].Contact_Records__c);
    }
}
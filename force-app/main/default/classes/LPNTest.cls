@isTest
public class LPNTest {
    @TestSetup
    static void leadEntry01(){
        Integer recordCount=150;
        for(Integer i=0;i<=recordCount;i=i+5){
            //i=30
            Lead lr = new lead();
            lr.FirstName = 'Santhu';
            lr.LastName = 'Rocky';
            lr.Phone = null;
            lr.MobilePhone = String.valueOf(i+10000000);
            lr.Company = 'C Company';
            lr.Status = 'Working-Contacted';
            insert lr;
       }
    }
    @isTest
    static void leadTest001(){
        List<Lead> listLead= [SELECT Id, Phone FROM Lead];
        System.debug('Total lead in system:'+listLead.size());
        Lead lt = [SELECT Id, Phone FROM Lead where MobilePhone='10000011'];
        update lt;
        Test.startTest();
        update lt;
        Test.stopTest();
        Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lt.Id];
    }
    @isTest
    static void leadTest011() {
        Lead lt = [SELECT Id, Phone FROM Lead];
        lt.Phone = '111111';
        update lt;
        Test.startTest();
        update lt;
        Test.stopTest();
        Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lt.id];
        System.assertEquals('111111', l.Phone);
    }
    @isTest
    static void leadTest111() {
        Lead lt = [SELECT Id, Phone FROM Lead];
        lt.Phone = null;
        lt.MobilePhone = null;
        update lt;
        Test.startTest();
        update lt;
        Test.stopTest();
        Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lt.id];
        System.assertEquals(null, l.Phone);
    }
    @isTest
    static void leadTes002() {
        Lead lt = [SELECT Id, Phone FROM Lead];
        lt.Phone = '99999';
        lt.MobilePhone = null;
        update lt;
        Test.startTest();
        update lt;
        Test.stopTest();
        Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lt.id];
        System.assertEquals('99999', l.Phone);
    }
    @isTest
    static void leadTestMix() {
        List<Lead> listLead= [SELECT Id, Phone FROM Lead];
        listLead[5].Phone='4400776611';
        listLead[95].Phone='4444551177';
        listLead[88].Phone='';
        update listLead;
        Test.startTest();
        update listLead;
        Test.stopTest();
        
        List<Lead> updatedLead = [SELECT Id, Phone FROM Lead];
        System.assertEquals('4400776611', listLead[5].Phone);
        System.assertEquals('9404571177', listLead[95].Phone);
        System.assertEquals('', listLead[88].Phone);
        System.assertEquals(updatedLead[99].MobilePhone,listLead[99].Phone);
        System.assertEquals(updatedLead[14].MobilePhone,listLead[14].Phone);
    }

}
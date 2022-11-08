@isTest
public class LeadTriggerTest111 {
	@TestSetUp
	static void leadEntry() {
        //Step 1: create multiple lead records
        // for(init the loop;compare the condition;increment ){}
        Integer recordCount=200;
		// List<Lead> listRecord=new List<Lead>();
        for(Integer i=0;i<=recordCount;i=i+2){
            Lead lRec1 = new Lead();
            lRec1.FirstName = 'Adam'+i;
            lRec1.LastName = 'Bryan'+i;
            lRec1.Phone = null;
            //i=99
            lRec1.MobilePhone =String.valueOf(i+10000000);
            //99+10000000='10000099'
            lRec1.Company = 'Julen';
            lRec1.Status = 'Working-Contacted';
			// listRecord.add(lRec1);
            insert lRec1;
        }
		// insert listRecord.add(lRec1);
        // System.assertEquals('',listLead[99].Phone);
	}
	@isTest
	static void leadTest() {
        List<Lead> listLead= [SELECT Id, Phone FROM Lead];
        System.debug('Total lead in system:'+listLead.size());
		Lead lc = [SELECT Id, Phone FROM Lead where MobilePhone='10000001'];
		update lc;
		Test.startTest();
		update lc;
		Test.stopTest();
		Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lc.id];
		// System.assertEquals('10000001', l.Phone);
	}
	@isTest
	static void leadTest1() {
		Lead lc = [SELECT Id, Phone FROM Lead];
		lc.Phone = '88673';
		update lc;
		Test.startTest();
		update lc;
		Test.stopTest();
		Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lc.id];
		System.assertEquals('88673', l.Phone);
	}
	@isTest
	static void leadTest3() {
		Lead lc = [SELECT Id, Phone FROM Lead];
		lc.Phone = null;
		lc.MobilePhone = null;
		update lc;
		Test.startTest();
		update lc;
		Test.stopTest();
		Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lc.id];
		System.assertEquals(null, l.Phone);
	}
	@isTest
	static void leadTest4() {
		Lead lc = [SELECT Id, Phone FROM Lead];
		lc.Phone = '98989';
		lc.MobilePhone = null;
		update lc;
		Test.startTest();
		update lc;
		Test.stopTest();
		Lead l = [SELECT Id, Phone FROM Lead WHERE id = :lc.id];
		System.assertEquals('98989', l.Phone);
	}
    @isTest
	static void leadTestmix() {
        List<Lead> listLead= [SELECT Id, Phone FROM Lead];
        listLead[1].Phone='0404571176';
        listLead[50].Phone='9404571177';
        //LISt index start from index 0
        update listLead;

		Test.startTest();
		update listLead;
		Test.stopTest();

		List<Lead> updatedLead = [SELECT Id, Phone FROM Lead];
		System.assertEquals('0404571176', listLead[1].Phone);
		System.assertEquals('9404571177', listLead[50].Phone);
		// System.assertEquals('10000099',updatedLead[99].Phone);
		System.assertEquals(updatedLead[99].MobilePhone,listLead[99].Phone);
	}
}
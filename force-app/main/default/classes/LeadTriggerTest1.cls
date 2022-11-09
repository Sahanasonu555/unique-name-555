@isTest
    public with sharing class LeadTriggerTest1 {
        @Testsetup static void maketestdata(){
            Lead leadObj = new Lead();
        leadObj.LastName='Test';
        leadObj.Company='C Company';
        leadObj.Status='Open - Not Contacted';
        leadObj.Phone='';
        leadObj.MobilePhone='0404571176';
        insert leadObj;
        }
    @isTest static void populatePhoneTest1() {
        Lead leadObj=[Select Id,phone from Lead Limit 1];
        //leadObj.Phone='';
        //leadObj.MobilePhone='0404571176';
        //update leadObj;
        Test.startTest();
        update leadObj;
        Test.stopTest();
        system.assertEquals('0404571176', leadObj.Phone);
    }
 @isTest static void populatePhoneTest2() {
        Lead leadObj=[Select Id,phone from Lead Limit 1];
     leadObj.phone='04045711243';
        leadObj.MobilePhone='0404571176';
        Test.startTest();
        //Lead leadObj=[Select Id,phone from Lead Limit 1];
        update leadObj;
        Test.stopTest();
        system.assertEquals('04045711243',leadObj.Phone);
    }
         @isTest static void populatePhoneTest3() {
       Lead leadObj=[Select Id,phone from Lead Limit 1];
        leadObj.phone=null;
        leadObj.MobilePhone=null;
        Test.startTest();
        //Lead polead1=[Select Id,phone from Lead where Id=:leadObj.Id];
        update leadObj;
        Test.stopTest();
        system.assertEquals(null,leadObj.Phone);
    }
        @isTest static void populatePhoneTest4() {
        Lead leadObj=[Select Id,phone from Lead Limit 1];
        leadObj.phone='04045711243';
        leadObj.MobilePhone=null;
        Test.startTest();
        //Lead polead2=[Select Id,phone from Lead where Id=:leadObj.Id];
        update leadObj;
        Test.stopTest();
        system.assertEquals('04045711243',leadObj.Phone);
        }
    }
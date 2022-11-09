@isTest
public class FCDQ {
    @isTest static void LeadfcdQ(){
        //List<Task> dataTask = new List<Task>();
        Integer recordCount=10;
        for(Integer i=0;i<recordCount;i++){
        Lead l = new Lead();
        l.FirstName='Arav'+i;
        l.LastName='Rao'+i;
        l.Email='aravr@gmail.com'+i;
        l.Phone='9977553355';
        l.Website='www.aravr.com'+i;
        l.Title='Glam'+i;
        l.Company='test company'+i;
        insert l;    
        Test.startTest();
        l.Fields_Populated__c=4;
        Test.stoptest();
        }
        //insert dataTask; 
    }
}
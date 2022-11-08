@isTest
public class oppoacc{
    @isTest public static void oppAccTest0(){
        Account acc = new Account();
        acc.Name ='Raghu';
        insert acc;
        Test.startTest();
        acc.NumberOfEmployees=100;
        update acc;
        Test.stoptest();
        Opportunity op1 = [Select Name, Id, CloseDate from Opportunity limit 1];
        System.assertEquals(Date.parse('10/6/2022'),op1.CloseDate);
    }
    @isTest 
        public static void oppAccTest1(){
        Account acc = new Account();
        acc.Name ='Raghu';
        insert acc;
        Test.startTest();
        acc.NumberOfEmployees=100;
        update acc;
        Test.stoptest();
        Opportunity op1 = [Select Id,Name from Opportunity limit 1];
        System.assertEquals('Raghu2022-09-26 00:00:00', op1.Name);
    }
        @isTest 
        public static void oppAccTest2(){
        Account acc = new Account();
        acc.Name ='Raghu';
        insert acc;
        Test.startTest();
        acc.NumberOfEmployees=100;
        update acc;
        Test.stoptest();
        Opportunity op1 = [Select Name, Id, StageName from Opportunity limit 1];
        System.assertEquals('Prospecting', op1.StageName);
    }
}
@isTest
private class SetupTest {
    @isTest static void leadphone() {
        Lead lacc = new Lead();
        lacc.FirstName = 'Wayne';
        lacc.Lastname = 'Rooney';
        lacc.Company='NA';
        lacc.Status = 'Not Confirmed';
        lacc.phone = null;
        lacc.mobilephone='9997234888';
        Insert lacc;
        Test.startTest();
        update lacc;
        Test.stoptest();
        Lead l = [ Select Id,Phone from Lead where id=:lacc.Id];
        System.assertEquals('9997234888', l.Phone) ;
       }
    @istest static void test1(){
        Lead lacc = new Lead();
        lacc.FirstName = 'Wayne';
        lacc.Lastname = 'Rooney';
        lacc.Company='NA';
        lacc.Status = 'Not Confirmed';
        lacc.phone = '9';
        lacc.mobilephone='9997234888';
        Insert lacc;
        Test.startTest();
        update lacc;
        Test.stoptest();
        Lead l = [Select Id, Phone from Lead where id=:lacc.Id];
        System.assertEquals('9', l.Phone) ;
    }
    @istest static void test2(){
        Lead lacc = new Lead();
        lacc.FirstName = 'Wayne';
        lacc.Lastname = 'Rooney';
        lacc.Company='NA';
        lacc.Status = 'Not Confirmed';
        lacc.phone = null;
        lacc.mobilephone=null;
        Insert lacc;
        Test.startTest();
        update lacc;
        Test.stoptest();
        Lead l = [Select Id, Phone from Lead where id=:lacc.Id];
        System.assertEquals(null, l.Phone) ;
    }
    @istest static void test3(){
        Lead lacc = new Lead();
        lacc.FirstName = 'Wayne';
        lacc.Lastname = 'Rooney';
        lacc.Company='NA';
        lacc.Status = 'Not Confirmed';
        lacc.phone = '9997234888';
        lacc.mobilephone=null;
        Insert lacc;
        Test.startTest();
        update lacc;
        Test.stoptest();
        Lead l = [Select Id, Phone from Lead where id=:lacc.Id];
        System.assertEquals('9997234888', l.Phone) ;
    }
}
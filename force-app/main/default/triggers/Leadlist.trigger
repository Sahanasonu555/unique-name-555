trigger Leadlist on Lead (before insert) {
    List<Lead> listLead =  new List<lead>();
String phone='8999999999';
for(Integer i=0;i<2000;i++){
Lead lead= new Lead();
lead.LastName='LastName-'+i;
lead.Company='Contrivers';
if(Math.mod(i,2)==0){
    lead.FirstName='FirstName_'+i;
}
if(Math.mod(i,3)==0){
    lead.Email='email'+i+'@gmail.com';
}
if(Math.mod(i,4)==0){
    lead.MobilePhone=String.valueOf(Math.round((Math.random() * (900000) + 100000000)));
}
if(Math.mod(i,5)==0){
    lead.Phone=String.valueOf(Math.round((Math.random() * (900000) + 100000000)));
}
Lead.Status='Open';
listLead.add(lead);
}
insert listLead;
}
trigger Duplicate on Lead (before insert,before update)
{
List<Contact> con = [SELECT Id, Email, FirstName, LastName FROM Contact WHERE EMAIL != Null AND FirstName != null AND LastName !=null];
Integer n = con.size();
Integer i = 0;
for (Lead le : Trigger.new)
{
for(i = 0; i < n; i++)
{
if(le.Email == con[i].Email && le.FirstName == con[i].FirstName && le.LastName == con[i].LastName)
{
le.addError('A Duplicate Contact exists'+' '+ con[i].FirstName + ' ' + con[i].LastName);
}
}
}
}
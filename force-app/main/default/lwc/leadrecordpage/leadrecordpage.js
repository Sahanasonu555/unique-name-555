import { LightningElement } from 'lwc';
import LEAD_OBJECT from '@salesforce/schema/Lead';
import FIRSTNAME_FIELD from '@salesforce/schema/Lead.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Lead.LastName';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';


export default class Leadrecordpage extends LightningElement {
   
    leadObject = LEAD_OBJECT;
    fields = [FIRSTNAME_FIELD,LASTNAME_FIELD,COMPANY_FIELD];
    
    
    handleContactCreated(){}
        }
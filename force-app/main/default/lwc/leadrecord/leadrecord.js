import { LightningElement } from 'lwc';
import Lead_OBJECT from '@salesforce/schema/Lead';
import FirstNAME_FIELD from '@salesforce/schema/Lead.FirstName';
import LastNAME_FIELD from '@salesforce/schema/Lead.LastName';

import Company_FIELD from '@salesforce/schema/Lead.Company';


export default class Leadrecord extends LightningElement {
   
    leadObject = Lead_OBJECT;
    fields = [FirstNAME_FIELD,LastNAME_FIELD,Company_FIELD];
    
    
    handleSuccess(){}
        }
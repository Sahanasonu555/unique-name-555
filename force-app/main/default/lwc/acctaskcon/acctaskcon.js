import { LightningElement ,wire,track} from 'lwc';
import fetchAccount from '@salesforce/apex/accontask.acc1'

export default class Acctaskcon extends LightningElement {
contactName;
showFeatures = true;


contactCreatedParent(event){
    // this.contactName= event.detail
    this.contactName=true
}
}
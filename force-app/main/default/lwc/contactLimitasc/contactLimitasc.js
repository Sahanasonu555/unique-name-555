import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import GetConlists from '@salesforce/apex/ConlistLimit.GetConlists';
const COLUMNS = [
    { label: 'Contact Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' }
];
export default class ContactLimitasc extends LightningElement {
    columns = COLUMNS;
   @wire(GetConlists)
    contacts;
    isDisabled=false;
	connectedCallback() {}
	renderedCallback() {
		console.log(this.contacts)
	}
handleClick(event) {
    console.log("BUtton CLicked")
    GetConlists({
        ORDER :"Name"
    })
        .then((data) => {
            console.log("Server returned response")
            console.log(data)
            this.contacts = data
        })
        .catch((error) => {
        })
}
}
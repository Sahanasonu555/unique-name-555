import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import getContacts from '@salesforce/apex/contactinfo.getContacts';
const COLUMNS = [
    { label: 'Contact Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
];
export default class Contactinfolist extends LightningElement {
    columns = COLUMNS;
   @wire(getContacts)
    contacts;
    isDisabled=false;
	connectedCallback() {}
	renderedCallback() {
		console.log(this.contacts)
	}
handleClick(event) {
    console.log("BUtton CLicked")
    getContacts({
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
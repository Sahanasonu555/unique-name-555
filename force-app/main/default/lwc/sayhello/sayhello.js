import { LightningElement } from 'lwc';
export default class Sayhello extends LightningElement {
testWords = false;
Textmsg= "Hello";
handleClick(event) {
    this.testWords = true;
}
}
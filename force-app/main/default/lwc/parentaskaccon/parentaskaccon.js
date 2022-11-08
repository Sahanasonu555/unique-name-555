import { LightningElement ,wire,track} from 'lwc';

export default class Parentaskaccon extends LightningElement {
contactName;
showFeatures = true;


contactCreatedParent(event){
    // this.contactName= event.detail
    this.contactName=true
}
}
import { LightningElement, track } from 'lwc';
//import incvalue from "@salesforce/apex/inc2value.incvalue";

export default class CalInc extends LightningElement {
    @track Result = 0;
    @track Num1 = 0;


    handlechange(event){
       this.Num1 = Number(this.Num1)+2
       this.Result = this.Num1
      console.log(this.Result)
    }
}
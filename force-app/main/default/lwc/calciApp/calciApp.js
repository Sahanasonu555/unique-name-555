import { api,LightningElement, track } from "lwc";

export default class CalciApp extends LightningElement {
    @track Num11;
    @track Num22;
    @track Resultr0;
    @track Num33;
    @track Num44;
    @track Resultr1;
    @track Num55;
    @track Num66;
    @track Resultr2;
    @track Num77;
    @track Num88;
    @track Resultr3;

  @api 
  
  handlenum1(event){
    this.Num11=event.target.value
  }
  handlenum2(event){
    this.Num22=event.target.value
  }
  click1(){
    this.Resultr0 = Number(this.Num11)+Number(this.Num22);
    console.log(this.Resultr0)
  }
  @api 
  
  handlenum3(event){
    this.Num33=event.target.value
  }
  handlenum4(event){
    this.Num44=event.target.value
  }
  click2(){
    this.Resultr1 = Number(this.Num33) - Number(this.Num44);
    console.log(this.Resultr1)
  }
  @api
  
  handlenum5(event){
    this.Num55=event.target.value
  }
  handlenum6(event){
    this.Num66=event.target.value
  }
  click3(){
    this.Resultr2 = Number(this.Num55) * Number(this.Num66);
    console.log(this.Resultr2)
  }
  @api 
  
  handlenum7(event){
    this.Num77=event.target.value
  }
  handlenum8(event){
    this.Num88=event.target.value
  }
  click4(){
    this.Resultr3 = Number(this.Num77) / Number(this.Num88);
    console.log(this.Resultr3)
  }

}
import { api, LightningElement, track } from "lwc";

export default class CalSub extends LightningElement {
  @track Num1;
  @track Num2;
  @track Result;
@api
  calciwork() {
    this.Result = Number(this.Num1) - Number(this.Num2);
    console.log(this.Result)
  }

  handleChange1(event) {
    this.Num1 = event.target.value;
    console.log(this.Num1)
  }
  handleChange2(event) {
    this.Num2 = event.target.value;
    console.log(this.Num2)
  }
}
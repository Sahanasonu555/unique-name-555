import { api,LightningElement, track } from "lwc";

export default class Calculatorjump extends LightningElement {
  @track Num1;
  @track Num2;
  @track Result0;
  @track Num3;
  @track Num4;
  @track Result1;
  @track Num5;
  @track Num6;
  @track Result2;
  @track Num7;
  @track Num8;
  @track Result3;


  calciwork() {
    this.template.querySelector("c-calci-app").click1()
  }

  handleChange1(event) {
    this.Num1 = event.target.value;
    console.log(this.Num1)
  }
  handleChange2(event) {
    this.Num2 = event.target.value;
    console.log(this.Num2)
  }
  

  calciwork1() {
    this.template.querySelector("c-calci-app").click2()
  }

  handleChange3(event) {
    this.Num3 = event.target.value;
    console.log(this.Num3)
  }
  handleChange4(event) {
    this.Num4 = event.target.value;
    console.log(this.Num4)
  }
  

  calciwork2() {
    this.template.querySelector("c-calci-app").click3()
  }

  handleChange5(event) {
    this.Num5 = event.target.value;
    console.log(this.Num5)
  }
  handleChange6(event) {
    this.Num6 = event.target.value;
    console.log(this.Num6)
  }
  

  calciwork3() {
    this.template.querySelector("c-calci-app").click4()
  }

  handleChange7(event) {
    this.Num7 = event.target.value;
    console.log(this.Num7)
  }
  handleChange8(event) {
    this.Num8 = event.target.value;
    console.log(this.Num8)
  }
}
import { LightningElement } from "lwc";
import GetRandomDog from "@salesforce/apex/dogimageclick.GetRandomDog";
export default class DogImagedisplay extends LightningElement{
imageURL;
handleClick(){
    GetRandomDog()
    .then((data)=>{
        console.log(data)
        this.imageURL = data
})
}
}
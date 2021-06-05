import { LightningElement, api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';

export default class OrderConfirmation extends NavigationMixin(LightningElement) {

    @api products;
    @api nameopp;
    @api dateopp;
    @api valortotal;

    closeModal(){

        const calcelEvent = new CustomEvent ( "cancelconfirmation", {
            detail: {},
        });        
        this.dispatchEvent ( calcelEvent );        

    }


}
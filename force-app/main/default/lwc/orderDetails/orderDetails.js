import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

import { registerListener, fireEvent } from 'c/pubsub';

export default class OrderDetails extends LightningElement {

    @track _products = [];

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener('productselected', this.handleProductSelect,this);
    }

    handleProductSelect(product){

        console.log('product', product);

        let newProduct = {...JSON.parse(product)};

        this._products.push(  {...newProduct, quantity : 1} );

    }

}
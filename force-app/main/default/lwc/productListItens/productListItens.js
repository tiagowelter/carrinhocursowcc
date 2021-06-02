import { LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

import getProdutos from '@salesforce/apex/ProductController.getProducts';
import { registerListener, fireEvent } from 'c/pubsub';

export default class ProductListItens extends LightningElement {

    @track filter = null;

    @wire(CurrentPageReference) pageRef;

    @wire(getProdutos , {filter : '$filter' , numeroPagina : 1}) produtos;

    connectedCallback(){ 

        registerListener('filterChange', this.getChangedValue, this);
    
    }

    getChangedValue(param){

        this.filter = param;

        console.log('Esta recebendo valor de outro componente', this.filter);
        console.log('lista de produtos', this.produtos);

    }

}
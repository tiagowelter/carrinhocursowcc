import { LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

import getProdutos from '@salesforce/apex/ProductController.getProducts';
import { registerListener, unregisterAllListeners, fireEvent } from 'c/pubsub';

export default class ProductListItens extends LightningElement {

    @track filter = null;
    @track accountId = null;

    @wire(CurrentPageReference) pageRef;

    @wire(getProdutos , {filter : '$filter' , numeroPagina : 1}) produtos;

    connectedCallback(){ 

        registerListener('selectedAccount', this.getAccount, this);
        registerListener('filterChange', this.getChangedValue, this);
    
    }
    
    handleProductSelected(event) {
        console.log('disparou o evento');
        fireEvent(this.pageRef, 'productselected', event.detail);
    }
    
    disconnectedCallback() {
        unregisterAllListeners(this);
    }
    
    getChangedValue(param){

        this.filter = param;

        console.log('Esta recebendo valor de outro componente', this.filter);
        console.log('lista de produtos', this.produtos);

    }

    getAccount(account){

        this.accountId = account;
        console.log('CAPTUROU NO OUTRO COMPONENTE', account);

    }

    get getAccountId(){
        return this.accountId != null;
    }

}
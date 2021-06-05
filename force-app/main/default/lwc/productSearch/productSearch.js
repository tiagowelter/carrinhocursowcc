import { LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {registerListener, fireEvent} from 'c/pubsub';

export default class ProductSearch extends LightningElement {

    @track filter = null;
    @track accountId = null;

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        
        registerListener('selectedAccount', this.getAccount, this);

    }

    getAccount(account){

        this.accountId = account;
        console.log('CAPTUROU NO OUTRO COMPONENTE', account);

    }

    get getAccountId(){
        return this.accountId != null;
    }

    handleSearch(event){

        this.filter = event.target.value;
        this.fireFilterProds()

    }

    fireFilterProds(){

        this.delayTimeout = setTimeout(() =>{
            fireEvent(this.pageRef,'filterChange', this.filter);
        }, 350);

    }

}
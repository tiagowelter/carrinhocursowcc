import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import {fireEvent} from 'c/pubsub';

export default class SelectAccount extends LightningElement {

    @track accounts = [];

    @wire(CurrentPageReference) pageRef;

    @wire(getAccounts, {})
    wiredResponseAccount({
            error,
            data
    }){
        if(error){
            console.log('ERRO AO BUSCAR OS CLIENTES', JSON.stringify(error));
        }else if(data){
            this.accounts = JSON.parse(data);
        }
    }

    handleAccount(event){
        fireEvent(this.pageRef,'selectedAccount', event.detail.value);
    }

}
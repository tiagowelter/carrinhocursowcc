import { LightningElement, track } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import findOpportunities from '@salesforce/apex/OpportunitySummaryController.findOpportunities';

export default class OrderSummary extends LightningElement {

    @track opportunities = [];

    connectedCallback(){        
        this.findAllPurchases();
    }

    findAllPurchases(){

        findOpportunities({idOpportunit : null}).then( (response) => {

            //se der sucesso trabalhamos aqui
            console.log('retorno',response);
            this.opportunities = response;

        }).catch( (erro) => {

            //se der erro trabalhamos aqui
            console.log('erro',erro);


        });

    }

    executeNewPurchase(){
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'Carrinho1'
            }
        });
    }

}
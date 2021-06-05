import { LightningElement, api, track } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import executeOpportunityApex from '@salesforce/apex/OpportunityController.executeOpportunity';

export default class OrderConfirmation extends NavigationMixin(LightningElement) {

    @api products;
    @api nameopp;
    @api dateopp;
    @api valortotal;
    @api accountid;
    @track errorMessage = null;

    closeModal(){

        const calcelEvent = new CustomEvent ( "cancelconfirmation", {
            detail: {},
        });        
        this.dispatchEvent ( calcelEvent );        

    }

    executeOpportunity(){

        console.log('Entrou no botão');

        console.log('orderConfirmation recebeu accountId', this.accountid);

        executeOpportunityApex({nomeOpportunity : this.nameopp , dateClosed : this.dateopp, products: JSON.stringify(this.products), account : this.accountid }).then((response) => {

            let retorno = response.Id;

            console.log('INSERIU OPORTUNIDADE', JSON.stringify(response));
            console.log('ID OPORTUNIDADE', retorno);
            
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: retorno,
                    actionName : 'view'
                }
            });   
            
            //this.goToHome();

        }).catch( (error) => {
            
            console.log('ERRO AO SALVAR OPORTUNIDADE', JSON.stringify(error));
            this.errorMessage = JSON.stringify(error);

        });

    }

    goToHome(){
        this[NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            attributes: {
                apiName: 'Lista_Carrinho'
            }
        });
    }

    get getHasError(){
        return this.errorMessage != null;
    }

}
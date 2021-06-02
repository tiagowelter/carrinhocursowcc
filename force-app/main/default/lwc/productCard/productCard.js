import { api, LightningElement } from 'lwc';

export default class ProductCard extends LightningElement {

    _product;

    @api
    get product(){
        return this._product;
    }
    set product(value){

        this._product = {id: value.Id, name: value.Name, price: value.Price__c, image: value.ProductImageArticle__c};

    }

}
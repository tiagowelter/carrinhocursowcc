import { api, LightningElement } from 'lwc';

export default class ProductCard extends LightningElement {

    _product;

    @api
    get product(){
        return this._product;
    }
    set product(value){

        let imagePad = value.ProductImageArticle__c == null ? 'https://cdn.neemo.com.br/uploads/settings_webdelivery/logo/3136/image-not-found.jpg' : value.ProductImageArticle__c;
        let pricePad = value.Price__c == null ? 0 : value.Price__c;

        this._product = {id: value.Id, name: value.Name, price: pricePad, image: imagePad};

    }

    handleProductSelected(){
        this.dispatchEventSelectProduct();
    }

    dispatchEventSelectProduct(){
        const productSelected = new CustomEvent ( "selected", {
            detail: JSON.stringify(this._product),
        });        
        console.log('productSelected', productSelected);
        this.dispatchEvent ( productSelected );
    }

}
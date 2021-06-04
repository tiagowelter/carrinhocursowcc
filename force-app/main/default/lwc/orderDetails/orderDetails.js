import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

import { registerListener, fireEvent } from 'c/pubsub';

export default class OrderDetails extends LightningElement {

    @track _products = [];
    @track valorTotal = 0;

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener('productselected', this.handleProductSelect,this);
    }

    handleProductSelect(product){

        let newProduct = {...JSON.parse(product)};

        if( this.hasProductInList(newProduct) ){
            //SOMAR QUANTIDADE
            this.getProductFromList(newProduct).quantity++;
        }else{
            //INSERIR NOVO PRODUTO
            this._products.push(  {...newProduct, quantity : 1} );
        }

        this.calculateTotal();

    }

    handleRemoveProduct(event)
    {
        let productId = event.currentTarget.dataset.record;
        this._products = this._products.filter( (prod) => prod.id !== productId);
        this.calculateTotal();
    }

    get hasProduct(){
        return (this._products.length > 0);
    }

    calculateTotal(){

        this.valorTotal = this._products.reduce( (total, prod) => (total += prod.quantity*prod.price), 0 );

    }

    handleProductPrice(event)
    {
        let selectedItem = event.currentTarget.ariaRowIndex;
        this._products[selectedItem].price = event.currentTarget.value;
        this.calculateTotal();
    }

    handleProductQuantity(event)
    {
        let selectedItem = event.currentTarget.ariaRowIndex;
        this._products[selectedItem].quantity = event.currentTarget.value;
        this.calculateTotal();
    }

    hasProductInList(product){
        return this._products.filter( (prod) => prod.id === product.id ).length > 0;
    }

    getProductFromList(product){
        return this._products.find( prod => prod.id === product.id);
    }

}
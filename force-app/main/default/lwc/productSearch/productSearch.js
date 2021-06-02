import { LightningElement, track, wire } from 'lwc';
//import {CurrentPage} from 'lightning/navigation';
import { CurrentPageReference } from 'lightning/navigation';

import {fireEvent} from 'c/pubsub';

export default class ProductSearch extends LightningElement {

    @track filter = null;

    //@wire(CurrentPage) pageRef;
    @wire(CurrentPageReference) pageRef;

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
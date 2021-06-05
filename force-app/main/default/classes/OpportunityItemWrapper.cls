public class OpportunityItemWrapper {

    @AuraEnabled
    public String id {get;set;}

    @AuraEnabled
    public String name {get;set;}

    @AuraEnabled
    public Decimal price {get;set;}

    @AuraEnabled
    public Integer quantity {get;set;}

}

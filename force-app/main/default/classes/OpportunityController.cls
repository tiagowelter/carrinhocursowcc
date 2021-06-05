public with sharing class OpportunityController {

    @AuraEnabled
    public static Opportunity executeOpportunity(String nomeOpportunity, Date dateClosed, String products, String account)
    {

        system.debug('account '+ account);

        List<OpportunityItemWrapper> productsDeserialized = (List<OpportunityItemWrapper>) JSON.deserialize(products, List<OpportunityItemWrapper>.class);

        Pricebook2 pb2 = [select Id from Pricebook2 where IsStandard = true Limit 1];

        Opportunity opp = new Opportunity();
        opp.Name        = nomeOpportunity;
        opp.StageName   = 'Prospecting';
        opp.CloseDate   = dateClosed;
        opp.Pricebook2Id= pb2.Id;
        opp.AccountId   = account;
        insert opp;

        /*
        List<PricebookEntry> pbeList = [select Id, Product2Id from PricebookEntry where Pricebook2Id = :pb2.Id];
        map<Id, PricebookEntry> pbeMap = new map<Id, PricebookEntry>();
        for(PricebookEntry p : pbeList){
            pbeMap.put(p.Product2Id, p);
        }
        */

        List<OpportunityLineItem> itens = new List<OpportunityLineItem>();

        for(OpportunityItemWrapper o : productsDeserialized){

            //PricebookEntry pbeNoFor = pbeMap.get(o.id);
            OpportunityLineItem item = new OpportunityLineItem();
            item.OpportunityId  = opp.Id;
            item.Product2Id     = o.id;
            item.UnitPrice      = o.price;
            item.Quantity       = o.quantity;
            //item.PricebookEntryId = pbeNoFor.Id;
            itens.add(item);

        }
        
        if(itens.size() > 0){
            insert itens;
        }

        return opp;


    }

}

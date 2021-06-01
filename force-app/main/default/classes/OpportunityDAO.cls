public with sharing class OpportunityDAO {
    
    //Exemplo chamada developer console OpportunityDAO.getAllOpportunityListMetodo();
    public static List<Opportunity> getAllOpportunityListMetodo(){

        List<Opportunity> listOpportunityVariavel = [Select Id, Name, Account.CNPJ__c From Opportunity];

        system.debug('Lista com oportunidades não filtradas '+listOpportunityVariavel);

        return listOpportunityVariavel;

    }

    //Exemplo chamada developer console OpportunityDAO.getOpportunitiesByIdMetodo(new list<String>{'0065e000004EY4GAAW','0065e000004EY4JAAW'});
    public static List<Opportunity> getOpportunitiesByIdMetodo(List<String> pListIdsOportunidades){

        List<Opportunity> listOpportunityVariavel = [Select Id, Name From Opportunity Where Id IN :pListIdsOportunidades];

        system.debug('Lista com oportunidades filtradas '+listOpportunityVariavel);

        return listOpportunityVariavel;

    }

    public static List<Opportunity> getAllOpportunityListByCNPJMetodo(String pCnpj){
        
        List<Opportunity> listaOportunidadeVariavel = [Select Id, Name From Opportunity Where Account.CNPJ__c = :pCnpj];

        system.debug('Lista com oportunidades '+listaOportunidadeVariavel);

        return listaOportunidadeVariavel;
        
    }

}

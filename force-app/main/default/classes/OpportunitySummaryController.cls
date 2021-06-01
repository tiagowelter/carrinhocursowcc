public class OpportunitySummaryController {

    @AuraEnabled
    public static List<Opportunity> findOpportunities(String idOpportunit){

        List<Opportunity> opportunitiesList = OpportunityDAO.getAllOpportunityListMetodo();

        return opportunitiesList;

    }

}
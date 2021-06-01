@RestResource(urlMapping = '/WCC/Opportunity/*')

global with sharing class OpportunityRest {
    
    @HttpGet
    global static void getOpportunities(){

        RestRequest request     = RestContext.request;
        RestResponse resultRest = RestContext.response; //variavel com contexto de retorno

        String idOportunidade = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);

        List<Opportunity> oppList = new List<Opportunity>();
        if(String.isBlank(idOportunidade)){
            oppList = [Select Id, Name, GrossTotal__c From Opportunity]; //aqui listamos todas as oportunidades
        }else{
            oppList = [Select Id, Name, GrossTotal__c From Opportunity Where Id = :idOportunidade];
        }

        List<OpportunityWrapper> result = new List<OpportunityWrapper>(); //instanciamos a wrapper

        for(Opportunity o : oppList){

            result.add(new OpportunityWrapper(o.Id, o.Name, o.GrossTotal__c));

        }

        resultRest.responseBody = Blob.valueOf(JSON.serialize(result));
        resultRest.statusCode = 200;

    }

}

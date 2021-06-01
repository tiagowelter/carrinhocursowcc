@RestResource(urlMapping='/WCC/Leads/*')

global with sharing class LeadApi {

    @HttpGet
    global static void getLeads()
    {

        RestResponse resultRest = RestContext.response; //variavel com contexto de retorno

        List<Lead> listLeads = [Select Id, Name, Email, Phone From Lead];
        List<LeadWrapper> result = new List<LeadWrapper>();
        for(Lead l : listLeads){
            result.add(new LeadWrapper(l.Id, l.Name, l.Email, l.Phone));
        }

        resultRest.responseBody = Blob.valueOf(JSON.serialize(result));
        resultRest.statusCode = 200;

    }

    /*@HttpPost
    global static Id insertLeads(String lastName, String company, String statusLead, String email)
    {

        Lead leadInserido = new Lead(
            LastName = lastName,
            Company = company,
            Status = statusLead,
            Email = email
        );
        insert leadInserido;

        return leadInserido.Id;

    }*/

    @HttpPost
    global static void insertLeads(List<LeadInsertWrapper> leadList)
    {
        
        RestResponse resultRest = RestContext.response;

        List<Lead> leadForInsertList = new List<Lead>();

        for(LeadInsertWrapper l : leadList){
            Lead leadInserido = new Lead(
                LastName    = l.lastName,
                Company     = l.company,
                Status      = l.statusLead,
                Email       = l.email
            );
            leadForInsertList.add(leadInserido);
        }

        List<Id> idsResponseList = new List<Id>();

        if(leadForInsertList.size() > 0){

            Database.UpsertResult[] results = Database.upsert(leadForInsertList);

            for(Integer index =0 , size = results.size(); index < size; index++){

                if(results[index].isSuccess()){
                    Id idDoFor = results[index].Id;
                    idsResponseList.add(idDoFor);
                }else{
                    idsResponseList.add('XXXXX');
                }

            }

        }

        resultRest.responseBody = Blob.valueOf(JSON.serialize(idsResponseList));
        resultRest.statusCode = idsResponseList.size() > 0 ? 200 : 500;        

    }

}

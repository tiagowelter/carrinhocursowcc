public with sharing class PageResult {

    @AuraEnabled
    public Integer tamanhoPagina {get;set;}

    @AuraEnabled
    public Integer numeroPagina {get;set;}

    @AuraEnabled
    public Integer totalItensPesquisa {get;set;}

    @AuraEnabled
    public object[] produtos {get;set;}

}

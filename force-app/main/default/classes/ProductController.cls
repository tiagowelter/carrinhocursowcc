public with sharing class ProductController {

    @AuraEnabled(cacheable=true)
    public static PageResult getProducts(String filter , Integer numeroPagina){

        Integer PAGE_SIZE = 10;
        String whereClausula = '';

        if(filter != null){

            whereClausula = ' WHERE Name Like \'%'+filter+'%\'';

        }

        system.debug('count '+ 'SELECT count() From Product2 '+ whereClausula);

        PageResult result = new PageResult();
        result.tamanhoPagina = PAGE_SIZE;
        result.numeroPagina = numeroPagina;
        result.totalItensPesquisa = Database.countQuery('SELECT count() From Product2 '+ whereClausula);
        result.produtos = Database.query('SELECT Name, Id, ProductImageArticle__c, Price__c From Product2 '+ whereClausula+' ORDER BY Name');

        return result;

    }

}

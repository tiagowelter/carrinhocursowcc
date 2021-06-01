public class LeadWrapper {
    
    public string codigo {get;set;}
    public string nome_do_lead {get;set;}
    public string email {get;set;}
    public string telefone {get;set;}
    
    public LeadWrapper(String param1, String param2, String param3, String param4) 
    {
        codigo = param1;
        nome_do_lead = param2;
        email = param3;
        telefone = param4;
    }
}

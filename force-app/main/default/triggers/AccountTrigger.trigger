trigger AccountTrigger on Account (after insert, after update, before insert) {

    //Variáveis de contexto
    //Trigger.New //Lista com os novos valores
    //Trigger.Old // Lista com valores antigos

    if(Trigger.isInsert){
        List<Task> insertTaskListVariavel = new List<Task>();
        for(Account variavelDoFor : Trigger.New){
    
            Task taskVariavel = new Task();
            taskVariavel.Subject = 'Verificar dados cadastrais';
            taskVariavel.ActivityDate = system.Today();
            taskVariavel.WhatId = variavelDoFor.Id;
        
            insertTaskListVariavel.add(taskVariavel);
        }
        insert insertTaskListVariavel;
    }

}
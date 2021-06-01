public with sharing class Carro {

    public static void trocarRodas(){
        String estadoDasRodas = 'Velho';
        estadoDasRodas = 'Novo';
        system.debug('estadoDasRodas '+estadoDasRodas);
    }

    public static void LigarFarol(){
        Boolean farolLigado = false;
        farolLigado = true;
        system.debug('farolLigado '+farolLigado);
    } 
    
    public static Boolean LigarMotor(Boolean giraChave){
        
        Boolean motorLigado;

        if(giraChave == true){
            motorLigado = true;
        }else{
            motorLigado = false;
        }

        return motorLigado;
    }

    public static Boolean acelerarMetodo(Boolean acelerouVariavel){

        Boolean motorAceleradoVariavel;

        if(acelerouVariavel == true){
            motorAceleradoVariavel = true;
        }else{
            motorAceleradoVariavel = false;
        }

        return motorAceleradoVariavel;
        
    }

    public static void CorDoCarro(String cor){

        if(cor == 'pink'){
            cor = 'rosa';
        }

        system.debug('A cor do carro é ' + cor);

    }

    public static Integer velocidadeCarroMetodo(Integer marcha){

        Integer velocidade = 0;

        if(marcha == 1){
            velocidade = 10;
        }else if(marcha == 2){
            velocidade = 20;
        }else if(marcha == 3){
            velocidade = 30;
        }else if(marcha >= 4){
            velocidade = 100;
        }

        return velocidade;

    }

}

public with sharing class Motorista {

    public static void giraraChave(Boolean giraChave)
    {

        system.debug('motor ligado? '+Carro.LigarMotor(giraChave));

    }

    public static Boolean pisarAcelerador(Boolean aceleraVariavel){

        Boolean acelerouMotorVariavel = Carro.acelerarMetodo(aceleraVariavel);

        system.debug('Acelerou o motor? ' + acelerouMotorVariavel);

        return acelerouMotorVariavel;

    }

    public static void FrearCarro(Boolean freiou){

        Carro.acelerarMetodo(freiou);

    }

    //desafio 4
    public static Boolean PodeAbrirPorta(Boolean acelerou){

        Boolean retorno = pisarAcelerador(acelerou);

        if(retorno == true){
            retorno = false;
        }else{
            retorno = true;
        }

        return retorno;

    }

    public static void TrocarMarchaMetodo(Integer pNumeroDaMarcha){

        Integer velocidadeVariavel = Carro.velocidadeCarroMetodo(pNumeroDaMarcha);

        system.debug('A velocidade do carro é: '+velocidadeVariavel);

    }

}
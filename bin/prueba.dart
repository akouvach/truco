
import 'dart:ffi';

import 'package:prueba/prueba.dart' as prueba;
import 'dart:io';



void main(List<String> arguments) {
  
  int i,cont=0,j,cont1=0,maxvalor,num_jug;
  var vec_valor=[40,39,38,37,36,36,36,36,32,32,32,32,28,28,26,26,26,26,22,22,22,22,18,18,18,18,14,14,12,12,12,12,8,8,8,8,4,4,4,4];
  var vec_carta=["1 de espada","1 de basto","7 de espada","7 de oro","3 de espada","3 de oro","3 de basto","3 de copa","2 de copa","2 de basto","2 de espada","2 de oro","1 de copa","1 de oro","12 de copa","12 de espada","12 de oro","12 de basto","11 de basto","11 de oro","11 de espada","11 de copa","10 de copa","10 de basto","10 de oro","10 de espada","7 de basto","7 de copa","6 de oro","6 de copa","6 de espada","6 de basto","5 de espada","5 de oro","5 de basto","5 de copa","4 de copa","4 de basto","4 de oro","4 de espada"];
  var vec_mazo=["0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"];
  var vec_jug1=["0","0","0"];
  var vec_jug2=["0","0","0"];
  var jugadores=[["0","0","0"],["0","0","0"],["0","0","0"],["0","0","0"]];
  var valor_jug1,valor_jug2;
  print("Bienvenido");
  print("Ingrese el nombre del jugador: ");
  var nombre= stdin.readLineSync();
  print("Bienvenido $nombre");

  for(i=0;i<40;i++)
  {
    vec_mazo[i]=vec_carta[i]; 
  }
  vec_mazo.shuffle();

//Asigno tres cartas a cada jugador

  for(j=0;j<3;j++)
  {
    for(i=0;i<jugadores.length;i++)
    {
      jugadores[i][j]=vec_mazo[cont];
      cont++;
    }

  }

  //Se comparan los valores para saber quien gano
  print(jugadores);
  for(i=0;i<3;i++)
  {
    maxvalor=0;
    num_jug=-1;

      for(j=0;j<jugadores.length;j++)
      {
        valor_jug1=Busqueda(vec_carta,vec_valor,jugadores[j][i]);
        //cont1++;
        if(valor_jug1>maxvalor)
        {
          maxvalor=valor_jug1;
          num_jug=j;
        }

        // valor_jug2=Busqueda(vec_carta,vec_valor,jugadores[cont1][i]);
      }
      

      print("El ganador de la ronda $i es $num_jug con valor $maxvalor");

      // if(valor_jug2<valor_jug1)
      // {
      //   print("Gano jugador 1");
      // }
      // else
      // {
      //   if(valor_jug2==valor_jug1)
      //   {
      //     print("Empate");
      //   }
      //   else
      //   {
      //     print("Gano jugador 2");
      //   }
      // }

    cont1=0;

  }

  //armar los equipos (par e impar)
  //fijarse cuando hay empate(se define en la otra ronda)
  // si llega a dos rondas ganadas, se corta
  
}

int Busqueda( List<String> vc, List<int> vv, String x)
{
  int val=-1,i=0;

  while(val==-1&&i<vc.length)
{
  if(vc[i]==x)
  {
    val=vv[i];

  }
   else
   {
     i++;

   }


}	

return val;


}





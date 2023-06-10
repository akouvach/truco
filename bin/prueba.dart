import 'dart:ffi';

import 'package:prueba/prueba.dart' as prueba;
import 'dart:io';

void main(List<String> arguments) {
  int i, cont, j, cont1 = 0, maxvalor, num_jug, vof,cont_equip1=0,cont_equip2=0;
  var vec_valor = [
    40,
    39,
    38,
    37,
    36,
    36,
    36,
    36,
    32,
    32,
    32,
    32,
    28,
    28,
    26,
    26,
    26,
    26,
    22,
    22,
    22,
    22,
    18,
    18,
    18,
    18,
    14,
    14,
    12,
    12,
    12,
    12,
    8,
    8,
    8,
    8,
    4,
    4,
    4,
    4
  ];
  var vec_carta = [
    "1 de espada",
    "1 de basto",
    "7 de espada",
    "7 de oro",
    "3 de espada",
    "3 de oro",
    "3 de basto",
    "3 de copa",
    "2 de copa",
    "2 de basto",
    "2 de espada",
    "2 de oro",
    "1 de copa",
    "1 de oro",
    "12 de copa",
    "12 de espada",
    "12 de oro",
    "12 de basto",
    "11 de basto",
    "11 de oro",
    "11 de espada",
    "11 de copa",
    "10 de copa",
    "10 de basto",
    "10 de oro",
    "10 de espada",
    "7 de basto",
    "7 de copa",
    "6 de oro",
    "6 de copa",
    "6 de espada",
    "6 de basto",
    "5 de espada",
    "5 de oro",
    "5 de basto",
    "5 de copa",
    "4 de copa",
    "4 de basto",
    "4 de oro",
    "4 de espada"
  ];
  var vec_mazo = [
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0"
  ];
  var vec_jug1 = ["0", "0", "0"];

  /* este vector jugadas se utiliza para almacenar algunos valores
  el primero es el máximo valor
  el segundo es el equipo al que pertenece el máximo (1, los pares, 2 los impares). Si es cero, será un empate
  el tercero es el jugador maximo .  Será -1 si es un empate.*/
  var jugadas = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  var vec_jug2 = ["0", "0", "0"];
  var jugadores = [
    ["0", "0", "0"],
    ["0", "0", "0"],
    ["0", "0", "0"],
    ["0", "0", "0"],
    ["0", "0", "0"],
    ["0", "0", "0"]
  ];
  int valor_carta;
  print("Bienvenido");
  print("Ingrese el nombre del jugador: ");
  var nombre = stdin.readLineSync();
  print("Bienvenido $nombre");

/* Cargo las cartas en el vector vec_mazo y las mezclo */
  for (i = 0; i < 40; i++) {
    vec_mazo[i] = vec_carta[i];
  }
  vec_mazo.shuffle();

//Asigno tres cartas a cada jugador
  for (j = 0; j < 3; j++) {
    for (i = 0; i < jugadores.length; i++) {
      jugadores[i][j] = vec_mazo[cont1];
      cont1++;
    }
  }

  /* veo los jugadores cómo fueron asignados */
  print("Asignación de jugadores:\n-----------------------");
  for (int i = 0; i < jugadores.length; i++) {
    print("$i: ${jugadores[i]}");
  }

  //Se comparan los valores para saber quien gano
  for (i = 0; i < 3; i++) {
    maxvalor = 0;
    num_jug = -1;

    for (j = 0; j < jugadores.length; j++) {
      /* obtengo el valor de la carga del jugador */
      valor_carta = Busqueda(vec_carta, vec_valor, jugadores[j][i]);
      vof = Equipo(num_jug);

      if (valor_carta > maxvalor) {
        /* reemplazo al máximo hasta ahora */
        maxvalor = valor_carta;
        num_jug = j;
        /* utilizo la funcion Equipo para saber a qué equipo corresponde */
        jugadas[i][0] = maxvalor;
        jugadas[i][1] = vof;
        jugadas[i][2] = num_jug;
      } else {
        /* si la carta es la misma, y el equipo es el mismo.. entonces nada cambia
        Si la carta es la misma y el anterior máximo es distinto.. ahora hay empate 
        y por lo tanto vamos a cambiar el grupo y  máximo jugador */
        if (valor_carta == maxvalor && vof != jugadas[i][1]) {
          /* como el anterior máximo y este pertenecen a distintos equipos, hay que 
          cambiar el registro por los datos del empate*/
          jugadas[i][1] =
              0; // le pongo 0 para saber que es un empate, esta ronda, hasta ahora...
        }
      }
    }
    if(cont_equip2!=2&&cont_equip1!=2)
    {
      switch(jugadas[i][1])
      {
        case 1:
        cont_equip1++;
        break;

        case 2:
        cont_equip2++;
        break;
      }

    }else
    {
      if(cont_equip2<cont_equip1)
      {
        print("Gano equipo 1");
      }
      else
      {
        print("Gano equipo 2");
      }
    }
   

    
  }

  for (int i = 0; i < jugadas.length; i++) {
    print("jugada :$i ${jugadas[i]}");
  }

  //Se recorre el vector de jugadas y se determina que equipo es el ganador
    //print("$cont_equip1,$cont_equip2");
  
  

  
}

int Busqueda(List<String> vc, List<int> vv, String x) {
  int val = -1, i = 0;

  while (val == -1 && i < vc.length) {
    if (vc[i] == x) {
      val = vv[i];
    } else {
      i++;
    }
  }

  return val;
}

int Equipo(int num) {
  if (num % 2 == 0) {
    return 1;
  } else {
    return 2;
  }
}

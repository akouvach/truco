// import 'package:prueba/prueba.dart' as prueba;
import 'dart:io';

void main(List<String> arguments) {
  // print('Hello world: ${prueba.calculate()}!');
  print("Ingrese el nombre del jugador: ");
  var nombre = stdin.readLineSync()!;
  stdout.write("su nombre $nombre");
  // print("Se ingreso el nombre $nombre");
}

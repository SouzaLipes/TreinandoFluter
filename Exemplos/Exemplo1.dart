import 'dart:io';
void main() {
// Imprimir a mensagem "Hello, Dart!"
print('Hello, Dart!');
// Solicitar o nome do usuário
stdout.write('Digite seu nome: ');
String? nome = stdin.readLineSync();
// Imprimir a mensagem personalizada
print('Hello, $nome!');
}


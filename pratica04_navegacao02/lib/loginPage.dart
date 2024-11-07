import 'package:flutter/material.dart';
import 'LIstItem.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _verificarCredenciais() {
    final String usuario = _usuarioController.text;
    final String senha = _senhaController.text;

    if (usuario == "eumesmo@gmail.com" && senha == "12345") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListItemPage(usuario: usuario), 
        ),
      );
    } else {
      _mostrarDialogoErro();
    }
  }

  void _mostrarDialogoErro() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Dados Inválidos"),
          content: const Text("Usuário e/ou senha incorreto(a)"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer: const Drawer(
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: "Usuário"),
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    controller: _usuarioController, 
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: "Senha"),
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    obscureText: true,
                    controller: _senhaController, 
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _verificarCredenciais,
                  child: const Text("Entrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'cadastroPage.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}


class _MyLoginPageState extends State<MyLoginPage> {
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
                const SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(labelText: "Usuario"),
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(labelText: "Senha"),
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MycadastroPagState()),
                    );
                  },
                  child: const Text("Cadastrar"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Entrar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


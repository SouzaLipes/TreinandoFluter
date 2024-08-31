import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white),), centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: const Drawer(
        backgroundColor: Colors.orange,
      ),
      body: Container(
          decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('./images/back.webp'),
            fit: BoxFit.cover
          )),
        child: Align( alignment: Alignment.center,
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
              child:            TextField(
              decoration: InputDecoration(labelText: "Senha"),
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){}, child: const Text("Entrar"))
          ],
        ),
      ),
      ),
      bottomNavigationBar:  BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ]),
      ),
    );
  }
}

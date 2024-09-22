import 'package:flutter/material.dart';

class MyHomePageState  extends StatefulWidget {
  const MyHomePageState ({super.key});

  @override
  State<MyHomePageState> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bem vindo a pagina inicial',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Butao de teste'),
                  ),
                );
              },
              child: const Text('Clique'),
            ),
          ],
        ),
      ),
    );
  }
}

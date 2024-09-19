import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'cadastroPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex, // Controla qual página será exibida
          children: [
            MyLoginPage(), // Página de login
            MycadastroPagState(), // Página de cadastro
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Controla o índice atual
          onTap: (int index) {
            setState(() {
              _currentIndex = index; // Atualiza o índice da página atual
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: 'Cadastro',
            ),
          ],
        ),
      ),
    );
  }
}

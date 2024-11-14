import 'package:flutter/material.dart';
import 'cadastroUsuario.dart';
import 'atualizarUsuario.dart';
import 'listarExcluirUsuario.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CadastroUsuario(),
    AtualizarUsuario(),
    ListarExcluirUsuario(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Atualizar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listar/Excluir',
          ),
        ],
      ),
    );
  }
}

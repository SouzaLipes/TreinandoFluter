import 'package:flutter/material.dart';
import 'HomeScreenPage.dart';
import 'LIstItem.dart';
import 'ProfileScreenPage.dart';

class BemVindoPage extends StatefulWidget {
  final String nomeUsuario;

  const BemVindoPage({super.key, required this.nomeUsuario});

  @override
  _BemVindoPageState createState() => _BemVindoPageState();
}

class _BemVindoPageState extends State<BemVindoPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(nomeUsuario: widget.nomeUsuario),
      ListItemPage(usuario: widget.nomeUsuario),
      ProfileScreen(nomeUsuario: widget.nomeUsuario),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem-vindo"),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

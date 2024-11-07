import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String nomeUsuario;

  const HomeScreen({super.key, required this.nomeUsuario});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _lastLogin;

  @override
  void initState() {
    super.initState();
    _loadLastLogin();
  }

  Future<void> _loadLastLogin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastLogin = prefs.getString('lastLogin') ?? 'Primeiro login';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem-vindo, ${widget.nomeUsuario}!',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'Último login: $_lastLogin',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

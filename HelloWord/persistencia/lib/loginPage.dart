import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bemVindoPage.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final senha = prefs.getString('senha');

    if (_emailController.text == email && _senhaController.text == senha) {
      // Armazena a hora do último login bem-sucedido
      final agora = DateTime.now().toString();
      await prefs.setString('lastLogin', agora);

      // Navega para a tela de boas-vindas com o nome do usuário
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BemVindoPage(
            nomeUsuario: 'Usuário', // Substitua pelo nome do usuário se necessário
          ),
        ),
      );
    } else {
      // Exibe um diálogo de erro se os dados estiverem incorretos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro de login'),
          content: const Text('Email ou senha incorretos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}

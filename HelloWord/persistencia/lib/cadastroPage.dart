import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MycadastroPagState extends StatefulWidget {
  const MycadastroPagState({super.key});

  @override
  State<MycadastroPagState> createState() => __MycadastroPagState();
}

class __MycadastroPagState extends State<MycadastroPagState> {
  bool _obscureText = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  Future<void> _salvarCadastro() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('senha', _senhaController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dados cadastrados com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create an account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                width: 375,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 375,
                child: TextField(
                  controller: _senhaController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 375,
                child: ElevatedButton(
                  onPressed: _salvarCadastro,
                  child: const Text("Registrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'database_helper.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({Key? key}) : super(key: key);

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cursoController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> _salvarUsuario() async {
    Map<String, dynamic> usuario = {
      "matricula": _matriculaController.text,
      "nome": _nomeController.text,
      "curso": _cursoController.text,
      "idade": int.tryParse(_idadeController.text) ?? 0,
    };

    await _dbHelper.inserirUsuario(usuario);

    _matriculaController.clear();
    _nomeController.clear();
    _cursoController.clear();
    _idadeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(labelText: "Matrícula"),
            ),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: _cursoController,
              decoration: const InputDecoration(labelText: "Curso"),
            ),
            TextField(
              controller: _idadeController,
              decoration: const InputDecoration(labelText: "Idade"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarUsuario,
              child: const Text("Salvar Usuário"),
            ),
          ],
        ),
      ),
    );
  }
}

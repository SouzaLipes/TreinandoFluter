import 'package:flutter/material.dart';
import 'database_helper.dart';

class ListarExcluirUsuario extends StatefulWidget {
  const ListarExcluirUsuario({Key? key}) : super(key: key);

  @override
  State<ListarExcluirUsuario> createState() => _ListarExcluirUsuarioState();
}

class _ListarExcluirUsuarioState extends State<ListarExcluirUsuario> {
  final TextEditingController _matriculaController = TextEditingController();
  Map<String, dynamic>? _usuario;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> _buscarUsuario() async {
    final matricula = _matriculaController.text;
    List<Map<String, dynamic>> resultado = await _dbHelper.listarUsuarios();
    final usuario = resultado.firstWhere(
      (user) => user['matricula'] == matricula,
      orElse: () => {},
    );

    setState(() {
      _usuario = usuario.isNotEmpty ? usuario : null;
    });

    if (_usuario == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário não encontrado")),
      );
    }
  }

  Future<void> _excluirUsuario() async {
    if (_usuario != null) {
      await _dbHelper.excluirUsuario(_usuario!['matricula']);
      setState(() {
        _usuario = null;
        _matriculaController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário excluído com sucesso")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nenhum usuário para excluir")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listar/Excluir Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(
                labelText: "Matrícula",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _buscarUsuario,
              child: const Text("Buscar Usuário"),
            ),
            const SizedBox(height: 20),
            if (_usuario != null) ...[
              Text("Nome: ${_usuario!['nome']}"),
              Text("Curso: ${_usuario!['curso']}"),
              Text("Idade: ${_usuario!['idade']}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _excluirUsuario,
                child: const Text("Excluir Usuário"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'database_helper.dart';

class AtualizarUsuario extends StatefulWidget {
  const AtualizarUsuario({Key? key}) : super(key: key);

  @override
  State<AtualizarUsuario> createState() => _AtualizarUsuarioState();
}

class _AtualizarUsuarioState extends State<AtualizarUsuario> {
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cursoController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Função para buscar o usuário pelo número de matrícula
  Future<void> _buscarUsuario() async {
    final matricula = _matriculaController.text;

    // Consulta o banco de dados para buscar o usuário com a matrícula especificada
    List<Map<String, dynamic>> resultado = await _dbHelper.listarUsuarios();
    final usuario = resultado.firstWhere(
      (user) => user['matricula'] == matricula,
      orElse: () => {},
    );

    if (usuario.isNotEmpty) {
      setState(() {
        _nomeController.text = usuario['nome'] ?? '';
        _cursoController.text = usuario['curso'] ?? '';
        _idadeController.text = usuario['idade'].toString();
      });
    } else {
      // Exibe uma mensagem caso o usuário não seja encontrado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário não encontrado")),
      );
    }
  }

  // Função para atualizar o usuário no banco de dados
  Future<void> _atualizarUsuario() async {
    final matricula = _matriculaController.text;

    Map<String, dynamic> usuarioAtualizado = {
      "nome": _nomeController.text,
      "curso": _cursoController.text,
      "idade": int.tryParse(_idadeController.text) ?? 0,
    };

    await _dbHelper.atualizarUsuario(matricula, usuarioAtualizado);

    // Limpa os campos após a atualização
    _matriculaController.clear();
    _nomeController.clear();
    _cursoController.clear();
    _idadeController.clear();

    // Confirma a atualização com uma mensagem
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuário atualizado com sucesso")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atualizar Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(labelText: "Matrícula"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _buscarUsuario,
              child: const Text("Buscar Usuário"),
            ),
            const SizedBox(height: 20),
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
              onPressed: _atualizarUsuario,
              child: const Text("Salvar Alterações"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListItemPage extends StatefulWidget {
  final String usuario; // Adiciona um parâmetro para o usuário

  ListItemPage({required this.usuario}); // Construtor

  @override
  _ListItemPageState createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  String description = 'Clique em um item {1} para mais informações.';

  String getWelcomeMessage() {
    return widget.usuario.split('@')[0];
  }

  void _updateDescription(int index) {
    setState(() {
      description = 'Clique em um item ${index + 1} para mais informações.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bem-vindo, ${getWelcomeMessage()}', 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    _updateDescription(index);
                    _showAlertDialog(context, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('Você clicou no item ${index + 1}'),
          actions: <Widget>[
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }
}

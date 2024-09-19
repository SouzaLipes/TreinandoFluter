import 'package:flutter/material.dart';

class MycadastroPagState extends StatefulWidget {
  const MycadastroPagState({super.key});

  @override
  State<MycadastroPagState> createState() => __MycadastroPagState();
}

class __MycadastroPagState extends State<MycadastroPagState> {
  bool _obscureText = true;
  String? _selecionado = "m";
  bool _emailNotification = true;
  bool _smsNotification = true;

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
            // Voltar para a tela anterior
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
              const SizedBox(
                width: 375,
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 375,
                child: TextField(
                  decoration: InputDecoration(labelText: "Data de nascimento"),
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 375,
                child: TextField(
                  decoration: InputDecoration(labelText: "Email"),
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 375,
                child: TextField(
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(30)),
                  const Text("Gênero: "),
                  const Padding(padding: EdgeInsets.all(32)),
                  const Text("Masculino"),
                  Radio<String>(
                    value: "m",
                    groupValue: _selecionado,
                    onChanged: (String? escolha) {
                      setState(() {
                        _selecionado = escolha;
                      });
                    },
                  ),
                  const Text("Feminino"),
                  Radio<String>(
                    value: "f",
                    groupValue: _selecionado,
                    onChanged: (String? escolha) {
                      setState(() {
                        _selecionado = escolha;
                      });
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Notificações:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SwitchListTile(
                title: const Text("E-mail"),
                value: _emailNotification,
                onChanged: (bool value) {
                  setState(() {
                    _emailNotification = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text("Celular"),
                value: _smsNotification,
                onChanged: (bool value) {
                  setState(() {
                    _smsNotification = value;
                  });
                },
              ),
              SizedBox(
                width: 375, // Ajuste a largura conforme necessário
                child: ElevatedButton(
                  onPressed: () {},
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

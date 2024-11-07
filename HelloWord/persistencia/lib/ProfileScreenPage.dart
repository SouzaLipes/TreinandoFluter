import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String nomeUsuario;

  const ProfileScreen({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Email: $nomeUsuario',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          const Text(
            'Outras informações...',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

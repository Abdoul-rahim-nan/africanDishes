import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changer le mot de passe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Mot de passe actuel',
                //obscureText: true,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nouveau mot de passe',
                //obscureText: true,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Confirmer le nouveau mot de passe',
                //obscureText: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Enregistrer le nouveau mot de passe
              },
              child: const Text('Changer le mot de passe'),
            ),
          ],
        ),
      ),
    );
  }
}

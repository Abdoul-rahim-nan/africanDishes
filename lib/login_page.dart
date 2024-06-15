import 'package:flutter/material.dart';
import 'categories_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Connexion utilisateur
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoriesPage(category: 'Plats principaux')),
                );
              },
              child: const Text('Se connecter'),
            ),
            ElevatedButton(
              onPressed: () {
                // Inscription utilisateur
              },
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}

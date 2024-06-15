import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Langue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Français'),
              trailing: Radio(
                value: 'fr',
                groupValue: 'fr',
                onChanged: (String? value) {
                  // Changer la langue en français
                },
              ),
            ),
            ListTile(
              title: const Text('English'),
              trailing: Radio(
                value: 'en',
                groupValue: 'fr',
                onChanged: (String? value) {
                  // Changer la langue en anglais
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

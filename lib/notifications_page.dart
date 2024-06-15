import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Notifications Push'),
              value: true,
              onChanged: (bool value) {
                // Gérer le changement de l'état des notifications push
              },
            ),
            SwitchListTile(
              title: const Text('Notifications par Email'),
              value: false,
              onChanged: (bool value) {
                // Gérer le changement de l'état des notifications par email
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:clase_am/services/db_service.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'user/user_form_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle Usuario")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre: ${user.name}", style: const TextStyle(fontSize: 18)),
            Text("Email: ${user.email}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),

            ElevatedButton(
              child: const Text("Editar"),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserFormScreen(user: user)),
                );
                Navigator.pop(context);
              },
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Eliminar"),
              onPressed: () async {
                await DbService().deleteUser(user.id!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
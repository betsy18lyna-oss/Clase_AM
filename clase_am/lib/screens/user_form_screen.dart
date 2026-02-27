import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/db_servise.dart';

class UserFormScreen extends StatefulWidget {
  final User? user;

  const UserFormScreen({super.key, this.user});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      nameController.text = widget.user!.name;
      emailController.text = widget.user!.email;
    }
  }

  void saveUser() async {
    final newUser = User(
      id: widget.user?.id,
      name: nameController.text,
      email: emailController.text,
    );

    if (widget.user == null) {
      await DbService().insertUser(newUser);
    } else {
      await DbService().updateUser(newUser);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? "Nuevo Usuario" : "Editar Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: saveUser, child: const Text("Guardar")),
          ],
        ),
      ),
    );
  }
}
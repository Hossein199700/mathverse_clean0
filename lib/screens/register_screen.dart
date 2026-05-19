import 'package:flutter/material.dart';
import '../services/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final u = TextEditingController();
  final p = TextEditingController();

  void register() {
    bool ok = AuthService.register(u.text, p.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ok ? "Account created" : "User already exists"),
      ),
    );

    if (ok) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: u, decoration: const InputDecoration(labelText: "Username")),
            TextField(controller: p, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const TextField(decoration: InputDecoration(labelText: 'Username')),
                  const SizedBox(height: 10),
                  const TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'),
                    icon: const Icon(Icons.login),
                    label: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
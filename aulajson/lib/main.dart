import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          body: Column(
            children: [
              Text("Digite um numero:"),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Digite aqui', // Corrigido para ser uma string
                ),
              ),
            ],
          ),
        ));
  }
}

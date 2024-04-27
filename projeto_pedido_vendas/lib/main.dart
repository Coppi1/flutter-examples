import 'package:flutter/material.dart';
import 'pages/telaAdicionarPedido.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anotar Pedidos',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TelaAdicionarPedido(),
    );
  }
}

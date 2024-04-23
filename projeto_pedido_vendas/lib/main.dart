import 'package:flutter/material.dart';
import 'package:projeto_pedido_vendas/pages/pedido_emitir.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Pedido(),
    );
  }
}

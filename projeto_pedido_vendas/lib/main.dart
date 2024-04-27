import 'package:flutter/material.dart';
import './models/telaAdicionarPedido.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

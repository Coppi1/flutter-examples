import 'package:flutter/material.dart';
import 'package:formulario_aula1803/components/Lista.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Lista(),
        appBar: AppBar(
          title: const Text("LineUp John Rock Marolas"),
          backgroundColor: const Color(0xFF0077ED),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => (), child: const Icon(Icons.add)),
      ),
    );
  }
}

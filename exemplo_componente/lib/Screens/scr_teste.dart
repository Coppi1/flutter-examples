import 'package:flutter/material.dart';

class scr_teste extends StatefulWidget {
  const scr_teste({super.key});

  @override
  State<scr_teste> createState() => _scr_testeState();
}

class _scr_testeState extends State<scr_teste> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: const Text("Teste passada"),
      )),
    );
  }
}

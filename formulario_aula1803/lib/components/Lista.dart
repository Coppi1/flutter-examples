import 'dart:math';

import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Card(
        child: ListTile(
          leading: Icon(Icons.music_note),
          title: Text("Alceu Valença e Zezin"),
          tileColor: Color.fromARGB(255, 231, 30, 30),
          subtitle: Text("Cantam: Coração Bobo"),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.music_note),
          title: Text("CPM 22"),
          tileColor: Color.fromARGB(255, 234, 212, 17),
          subtitle: Text("Canta: Um minuto para o fim do mundo"),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.music_note),
          title: Text("Slipknot"),
          tileColor: Color.fromARGB(255, 28, 188, 236),
          subtitle: Text("Canta: Vermilion"),
        ),
      ),
    ]);
  }
}

class ItensLista extends StatelessWidget {
  final String _titulo; // _ torna o atributo privado
  final String _subTitulo;

  const ItensLista(this._titulo, this._subTitulo, {super.key}); // construtor

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.music_note),
      title: Text(_titulo),
      tileColor: Colors.primaries[Random().nextInt(10)],
      subtitle: Text(_subTitulo),
    ));
  }
}

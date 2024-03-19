import 'package:flutter/material.dart';

class Animal extends StatelessWidget {
  final String _name;
  final Color _colorHouse;

  const Animal(this._name, this._colorHouse, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: _colorHouse),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(_name),
        ));
  }
}

import 'package:flutter/material.dart';

class teste_outro extends StatefulWidget {
  const teste_outro({super.key});

  @override
  State<teste_outro> createState() => _teste_outroState();
}

class _teste_outroState extends State<teste_outro> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione uma Cidade'),
      ),
      body: ListView(
        children: <Widget>[
          _buildCard('São Paulo'),
          _buildCard('Rio de Janeiro'),
          _buildCard('Belo Horizonte'),
          _buildCard('Porto Alegre'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedCity != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SecondScreen(selectedCity: selectedCity!)),
            );
          }
        },
        tooltip: 'Ir para a próxima tela',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }

  Widget _buildCard(String city) {
    return Card(
      child: ListTile(
        title: Text(city),
        trailing: DropdownButton<String>(
          value: selectedCity,
          icon: const Icon(Icons.arrow_downward),
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue;
            });
          },
          items: <String>[
            'São Paulo',
            'Rio de Janeiro',
            'Belo Horizonte',
            'Porto Alegre'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String selectedCity;

  const SecondScreen({super.key, required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cidade Selecionada'),
      ),
      body: Center(
        child: Text(
          'Cidade selecionada: $selectedCity',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

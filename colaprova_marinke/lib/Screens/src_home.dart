import 'package:colaprova_marinke/Screens/scr_teste.dart';
import 'package:colaprova_marinke/Screens/tela_teste_outra.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Select one';
  final List<String> dropdownItems = [
    'Select one',
    'Ourinhos',
    'Jacarézinho',
    'Irapé',
    'Iepe'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cola do Indiano Marolas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Text("Selecione a Cidade"),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const scr_teste(),
                    ));
              },
              child: const Text('Clique aqui'),
            ),
            Expanded(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Coluna 1'),
                  ),
                  DataColumn(
                    label: Text('Coluna 2'),
                  ),
                  DataColumn(
                    label: Text('Coluna 3'),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Célula 1')),
                      DataCell(Text('Célula 2')),
                      DataCell(Text('Célula 3')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Célula 1')),
                      DataCell(Text('Célula 2')),
                      DataCell(Text('Célula 3')),
                    ],
                  ),
                  // Adicione mais linhas conforme necessário
                ],
              ),
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const teste_outro(),
                    ));
              },
              child: const Text('Clique aqui'),
            ))
          ],
        ),
      ),
    );
  }
}

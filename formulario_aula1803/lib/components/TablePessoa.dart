import 'package:flutter/material.dart';
import 'package:formulario_aula1803/components/Pessoa.dart';

class TablePessoa extends StatefulWidget {
  const TablePessoa({Key? key}) : super(key: key);

  @override
  State<TablePessoa> createState() => _TablePessoaState();
}

class _TablePessoaState extends State<TablePessoa> {
  List<Pessoa> pessoas = [
    Pessoa(id: 1, nome: 'João', data_nascimento: DateTime(1990, 1, 1)),
    Pessoa(id: 2, nome: 'Maria', data_nascimento: DateTime(1995, 5, 5)),
    Pessoa(id: 3, nome: 'Carlos', data_nascimento: DateTime(2000, 10, 10)),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('ID'),
        ),
        DataColumn(
          label: Text('Nome'),
        ),
        DataColumn(
          label: Text('Data de Nascimento'),
        ),
      ],
      rows: pessoas
          .map((Pessoa pessoa) => DataRow(
                cells: <DataCell>[
                  DataCell(Text('${pessoa.id}')),
                  DataCell(Text(pessoa.nome)),
                  DataCell(Text(pessoa.data_nascimento.toString())),
                ],
              ))
          .toList(),
    );
  }
}

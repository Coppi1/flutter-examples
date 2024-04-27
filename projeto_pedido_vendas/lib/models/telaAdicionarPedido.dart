import 'package:flutter/material.dart';
import 'pedido.dart';
import './formaPagamento.dart';

class TelaAdicionarPedido extends StatefulWidget {
  const TelaAdicionarPedido({super.key});

  @override
  _TelaAdicionarPedidoState createState() => _TelaAdicionarPedidoState();
}

class _TelaAdicionarPedidoState extends State<TelaAdicionarPedido> {
  final _formKey = GlobalKey<FormState>();
  String _nomeProduto = '';
  int _quantidade = 0;
  double _valorTotal = 0.0;
  String _observacao = '';
  final DateTime _dataHora = DateTime.now();
  FormaPagamento _formaPagamento = FormaPagamento.cartaoDebito;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Pedido'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
                onSaved: (value) => _nomeProduto = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade';
                  }
                  return null;
                },
                onSaved: (value) => _quantidade = int.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor Total'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor total';
                  }
                  return null;
                },
                onSaved: (value) => _valorTotal = double.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Observação'),
                onSaved: (value) => _observacao = value!,
              ),
              const SizedBox(
                  height: 20), // Aumente o valor para criar mais espaço
              const Divider(color: Colors.black), // Risco suave
              const SizedBox(
                  height:
                      20), // Aumente o valor para criar mais espaço entre o risco suave e o título
              const Text('Forma de Pagamento',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10), // Espaço entre o título e o dropdown
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.9, // Define a largura do dropdown
                child: DropdownButton<FormaPagamento>(
                  value: _formaPagamento,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.orange,
                  ),
                  onChanged: (FormaPagamento? newValue) {
                    setState(() {
                      _formaPagamento = newValue!;
                    });
                  },
                  items: FormaPagamento.values
                      .map<DropdownMenuItem<FormaPagamento>>(
                          (FormaPagamento value) {
                    return DropdownMenuItem<FormaPagamento>(
                      value: value,
                      child: Text(value.nome),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20), // Espaço abaixo do dropdown
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aqui você pode adicionar a lógica para salvar o pedido
                    // Por exemplo, adicionar o pedido a uma lista ou salvar em um banco de dados
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Salvar Pedido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

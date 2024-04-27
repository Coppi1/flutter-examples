import 'package:flutter/material.dart';
import 'pedido.dart';
import './formaPagamento.dart';
import './telaResumoPedido.dart';
import '../dataBase/dataBase.dart';

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
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              const Text('Forma de Pagamento',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Pedido pedido = Pedido(
                      id: DateTime.now().millisecondsSinceEpoch,
                      nomeProduto: _nomeProduto,
                      quantidade: _quantidade,
                      valorTotal: _valorTotal,
                      observacao: _observacao,
                      dataHora: _dataHora,
                      formaPagamento: _formaPagamento.nome,
                    );
                    // Corrigindo a chamada do método insert
                    int id = await Database.instance
                        .insert('pedidos' as Pedido, pedido.toMap());
                    print('inserted row: $id');
                    // Limpar os campos do formulário
                    _formKey.currentState!.reset();
                    // Redefinir as variáveis de estado
                    setState(() {
                      _nomeProduto = '';
                      _quantidade = 0;
                      _valorTotal = 0.0;
                      _observacao = '';
                      _formaPagamento = FormaPagamento.cartaoDebito;
                    });
                    // Navegue para a tela de resumo de pedido
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaResumoPedido(
                          nomeProduto: _nomeProduto,
                          quantidade: _quantidade,
                          valorTotal: _valorTotal,
                          observacao: _observacao,
                          dataHora: _dataHora,
                          formaPagamento: _formaPagamento,
                        ),
                      ),
                    );
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

import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _produtoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _unidadeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();
  final TextEditingController _clienteNomeController = TextEditingController();
  final TextEditingController _vendedorController =
      TextEditingController(); // Você pode preencher este campo com o usuário logado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emitir Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _produtoController,
                decoration: const InputDecoration(
                  labelText: 'Produto',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantidadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, insira a quantidade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _unidadeController,
                decoration: const InputDecoration(
                  labelText: 'Unidade',
                ),
              ),
              TextFormField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                ),
              ),
              TextFormField(
                controller: _observacoesController,
                decoration: const InputDecoration(
                  labelText: 'Observações do Pedido',
                ),
              ),
              TextFormField(
                controller: _clienteNomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Cliente',
                ),
              ),
              TextFormField(
                controller: _vendedorController,
                decoration: const InputDecoration(
                  labelText: 'Vendedor',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Processar o pedido aqui
                      String produto = _produtoController.text;
                      int quantidade = int.parse(_quantidadeController.text);
                      String unidade = _unidadeController.text;
                      double valor = double.parse(_valorController.text);
                      String observacoes = _observacoesController.text;
                      String clienteNome = _clienteNomeController.text;
                      String vendedor = _vendedorController.text;
                      // Aqui você pode fazer o que quiser com os dados do formulário
                      print(
                          'Produto: $produto, Quantidade: $quantidade, Unidade: $unidade, Valor: $valor, Observações: $observacoes, Cliente: $clienteNome, Vendedor: $vendedor');
                      // Você pode adicionar lógica para enviar o pedido para algum lugar
                    }
                  },
                  child: const Text('Emitir Pedido'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

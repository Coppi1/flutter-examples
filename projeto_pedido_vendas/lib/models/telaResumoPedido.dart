import 'package:flutter/material.dart';
import './formaPagamento.dart';

class TelaResumoPedido extends StatelessWidget {
  final String nomeProduto;
  final int quantidade;
  final double valorTotal;
  final String observacao;
  final DateTime dataHora;
  final FormaPagamento formaPagamento;

  const TelaResumoPedido({
    super.key,
    required this.nomeProduto,
    required this.quantidade,
    required this.valorTotal,
    required this.observacao,
    required this.dataHora,
    required this.formaPagamento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Pedido'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Nome do Produto: $nomeProduto',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text('Quantidade: $quantidade',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text('Valor Total: R\$ $valorTotal',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text('Observação: $observacao',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text('Data e Hora: ${dataHora.toString()}',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text('Forma de Pagamento: ${formaPagamento.nome}',
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

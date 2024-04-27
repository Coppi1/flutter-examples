import 'package:flutter/material.dart';
import 'package:projeto_pedido_vendas/dtos/cliente_dto.dart'; // Importe o DTO do cliente
import 'package:projeto_pedido_vendas/dtos/pedido_dto.dart'; // Importe o DTO do pedido
import 'package:projeto_pedido_vendas/dao/cliente_dao.dart'; // Importe o DAO do cliente
import 'package:projeto_pedido_vendas/dao/pedido_dao.dart'; // Importe o DAO do pedido

class PedidoEmitirPage extends StatefulWidget {
  @override
  _PedidoEmitirPageState createState() => _PedidoEmitirPageState();
}

class _PedidoEmitirPageState extends State<PedidoEmitirPage> {
  final ClienteDAO _clienteDAO = ClienteDAO(); // Instância do DAO do cliente
  final PedidoDAO _pedidoDAO = PedidoDAO(); // Instância do DAO do pedido

  late ClienteDTO? _clienteSelecionado; // Cliente selecionado no dropdown
  late String? _tipoPedidoSelecionado; // Tipo de pedido selecionado no dropdown
  late String? _pedidoSelecionado; // Pedido selecionado no dropdown

  List<ClienteDTO> _clientes = []; // Lista de clientes
  List<String> _tiposPedido = [
    'Tipo 1',
    'Tipo 2',
    'Tipo 3'
  ]; // Tipos de pedido (exemplo)

  @override
  void initState() {
    super.initState();
    _carregarClientes(); // Carrega a lista de clientes ao iniciar a tela
  }

  // Método para carregar a lista de clientes
  Future<void> _carregarClientes() async {
    List<ClienteDTO> clientes = await _clienteDAO.selectAll();
    setState(() {
      _clientes = clientes;
    });
  }

  // Método para enviar o pedido
  Future<void> _enviarPedido() async {
    // Construa o PedidoDTO com os dados selecionados
    PedidoDTO pedido = PedidoDTO(
      cliente: _clienteSelecionado,
      tipoPedido: _tipoPedidoSelecionado,
      pedido: _pedidoSelecionado,
      // Adicione outros campos do pedido aqui
    );

    // Insira o pedido no banco de dados
    await _pedidoDAO.insert(pedido);

    // Navegue para a próxima tela ou exiba uma mensagem de sucesso
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emitir Pedido'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<ClienteDTO>(
              value: _clienteSelecionado,
              onChanged: (ClienteDTO? cliente) {
                setState(() {
                  _clienteSelecionado = cliente;
                });
              },
              items: _clientes.map((ClienteDTO cliente) {
                return DropdownMenuItem<ClienteDTO>(
                  value: cliente,
                  child: Text(cliente.nome ?? ''),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Cliente',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _tipoPedidoSelecionado,
              onChanged: (String? tipoPedido) {
                setState(() {
                  _tipoPedidoSelecionado = tipoPedido;
                  _pedidoSelecionado =
                      null; // Resetar o pedido selecionado quando o tipo de pedido é alterado
                });
              },
              items: _tiposPedido.map((String tipoPedido) {
                return DropdownMenuItem<String>(
                  value: tipoPedido,
                  child: Text(tipoPedido),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Tipo de Pedido',
              ),
            ),
            SizedBox(height: 16.0),
            // Dropdown para selecionar o pedido com base no tipo selecionado
            if (_tipoPedidoSelecionado != null)
              FutureBuilder<List<String>>(
                future:
                    _pedidoDAO.selectPedidosPorTipo(_tipoPedidoSelecionado!),
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  } else {
                    return DropdownButtonFormField<String>(
                      value: _pedidoSelecionado,
                      onChanged: (String? pedido) {
                        setState(() {
                          _pedidoSelecionado = pedido;
                        });
                      },
                      items: snapshot.data!.map((String pedido) {
                        return DropdownMenuItem<String>(
                          value: pedido,
                          child: Text(pedido),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Pedido',
                      ),
                    );
                  }
                },
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _enviarPedido,
              child: Text('Enviar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}

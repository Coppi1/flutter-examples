import 'package:flutter/material.dart';
import 'package:projeto_pedido_vendas/dtos/cliente_dto.dart';
import 'package:projeto_pedido_vendas/models/cliente.dart';
import 'package:projeto_pedido_vendas/repository/cliente_dao.dart';

class PedidoEmitirPage extends StatefulWidget {
  const PedidoEmitirPage({super.key});

  @override
  _PedidoEmitirPageState createState() => _PedidoEmitirPageState();
}

class _PedidoEmitirPageState extends State<PedidoEmitirPage> {
  final ClienteDAO _clienteDAO = ClienteDAO(); // Instância do DAO do cliente
  ClienteDTO? _clienteSelecionado; // Cliente selecionado no dropdown
  List<ClienteDTO> _clientes = []; // Lista de clientes

  @override
  void initState() {
    super.initState();
    _loadClientes();
  }

  void _loadClientes() async {
    // Limpa a lista antes de adicionar novos dados
    _clientes.clear();

    // Supondo que _clienteDAO.selectAll() retorna Future<List<Cliente>>
    List<Cliente> clientes = await _clienteDAO.selectAll();

    // Converte cada Cliente em um ClienteDTO
    List<ClienteDTO> clientesDTO =
        clientes.map((cliente) => ClienteDTO.fromCliente(cliente)).toList();

    // Atualiza o estado da aplicação com a lista de clientes DTO
    setState(() {
      _clientes = clientesDTO;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_clientes.isEmpty) {
      return const Center(child: Text('Nenhum cliente disponível.'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emitir Pedido'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
              decoration: const InputDecoration(
                labelText: 'Cliente',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_pedido_vendas/dtos/cliente_dto.dart';
import 'package:projeto_pedido_vendas/dtos/pedido_dto.dart';
import 'package:projeto_pedido_vendas/models/cliente.dart';
import 'package:projeto_pedido_vendas/models/vendedor.dart';
import 'package:projeto_pedido_vendas/repository/cliente_dao.dart';
import 'package:projeto_pedido_vendas/repository/pedido_dao.dart';

class PedidoEmitirPage extends StatefulWidget {
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

  // Criar um novo cliente
  ClienteDTO novoCliente = ClienteDTO(
    nome: 'João Silva',
    endereco: 'Rua das Flores, 123',
    cidade: 'São Paulo',
    nmrCpfCnpj: '123.456.789-00',
    vendedor: Vendedor(
        id: 1,
        nome: 'Vendedor 1'), // Supondo que você tenha um vendedor com ID 1
  );

  @override
  Widget build(BuildContext context) {
    if (_clientes.isEmpty) {
      return Center(child: Text('Nenhum cliente disponível.'));
    }

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
          ],
        ),
      ),
    );
  }
}

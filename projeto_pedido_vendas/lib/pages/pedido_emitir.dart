import 'package:flutter/material.dart';
import 'package:projeto_pedido_vendas/dtos/cliente_dto.dart';
import 'package:projeto_pedido_vendas/dtos/produto_dto.dart';
import 'package:projeto_pedido_vendas/dtos/vendedor_dto.dart';
import 'package:projeto_pedido_vendas/models/cliente.dart';
import 'package:projeto_pedido_vendas/models/produto.dart';
import 'package:projeto_pedido_vendas/models/vendedor.dart';
import 'package:projeto_pedido_vendas/repository/cliente_dao.dart';
import 'package:projeto_pedido_vendas/repository/produto_dao.dart';
import 'package:projeto_pedido_vendas/repository/vendedor_dao.dart';

class PedidoEmitirPage extends StatefulWidget {
  const PedidoEmitirPage({Key? key}) : super(key: key);

  @override
  _PedidoEmitirPageState createState() => _PedidoEmitirPageState();
}

class _PedidoEmitirPageState extends State<PedidoEmitirPage> {
  final ClienteDAO _clienteDAO = ClienteDAO();
  ClienteDTO? _clienteSelecionado;
  List<ClienteDTO> _clientes = [];

  final VendedorDAO _vendedorDAO = VendedorDAO();
  VendedorDTO? _vendedorSelecionado;
  List<VendedorDTO> _vendedoresLista = [];

  final ProdutoDAO _produtoDAO = ProdutoDAO();
  ProdutoDTO? _produtoSelecionado;
  List<ProdutoDTO> _produtosLista = [];

  int _quantidadeSelecionada = 1;
  final TextEditingController _observacoesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadClientes();
    _loadVendedores();
    _loadProdutos();
  }

  void _loadClientes() async {
    List<Cliente> clientes = await _clienteDAO.selectAll();
    List<ClienteDTO> clientesDTO =
        clientes.map((cliente) => ClienteDTO.fromCliente(cliente)).toList();
    setState(() {
      _clientes = clientesDTO;
    });
  }

  void _loadVendedores() async {
    List<Vendedor> vendedores = await _vendedorDAO.selectAll();
    List<VendedorDTO> vendedorDTO = vendedores
        .map((vendedor) => VendedorDTO.fromVendedor(vendedor))
        .toList();
    setState(() {
      _vendedoresLista = vendedorDTO;
    });
  }

  void _loadProdutos() async {
    List<Produto> produtos = await _produtoDAO.selectAll();
    List<ProdutoDTO> produtoDTO =
        produtos.map((produto) => ProdutoDTO.fromProduto(produto)).toList();
    setState(() {
      _produtosLista = produtoDTO;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Emitir Pedido'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Adicione a lógica para abrir o menu lateral aqui
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Adicione a lógica para abrir a tela de pesquisa aqui
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 16.0),
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
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text(cliente.nome ?? ''),
                      ],
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Cliente',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<VendedorDTO>(
                value: _vendedorSelecionado,
                onChanged: (VendedorDTO? vendedor) {
                  setState(() {
                    _vendedorSelecionado = vendedor;
                  });
                },
                items: _vendedoresLista.map((VendedorDTO vendedor) {
                  return DropdownMenuItem<VendedorDTO>(
                    value: vendedor,
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text(vendedor.nome ?? ''),
                      ],
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Vendedor',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<ProdutoDTO>(
                value: _produtoSelecionado,
                onChanged: (ProdutoDTO? produto) {
                  setState(() {
                    _produtoSelecionado = produto;
                  });
                },
                items: _produtosLista.map((ProdutoDTO produto) {
                  return DropdownMenuItem<ProdutoDTO>(
                    value: produto,
                    child: Row(
                      children: [
                        Text(
                          '${produto.quantidade}x ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.shopping_cart),
                        const SizedBox(width: 8),
                        Text(produto.nome ?? ''),
                      ],
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Produto',
                  prefixIcon: const Icon(Icons.shopping_cart),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                  prefixIcon: const Icon(Icons.format_list_numbered),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _quantidadeSelecionada = int.parse(value);
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _observacoesController,
                decoration: InputDecoration(
                  labelText: 'Observações',
                  prefixIcon: const Icon(Icons.notes),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Lógica para enviar o pedido
            print('Pedido enviado!');
          },
          child: const Icon(Icons.send),
        ),
      ),
    );
  }
}

void main() {
  runApp(const PedidoEmitirPage());
}

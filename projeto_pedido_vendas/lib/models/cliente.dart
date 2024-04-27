import 'dart:convert';
import 'package:projeto_pedido_vendas/models/vendedor.dart';

class Cliente {
  int? id;
  String? nome;
  String? endereco;
  String? cidade;
  String? nmrCpfCnpj;
  Vendedor? vendedor;

  Cliente(
      {this.id,
      this.cidade,
      this.endereco,
      this.nome,
      this.nmrCpfCnpj,
      this.vendedor});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      cidade: json['cidade'],
      vendedor: Vendedor.fromJson(json['vendedor']),
      nome: json['nome'],
      endereco: json['endereco'],
      nmrCpfCnpj: json['nmrCpfCnpj'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cidade': cidade,
      'vendedor': vendedor?.toJson(),
      'nome': nome,
      'endereco': endereco,
      'nmrCpfCnpj': nmrCpfCnpj,
    };
  }
}

// Future<List<Cliente>> carregarClientes(Vendedor vendedor) async {
//   final response = await http
//       .get(Uri.parse('http://$address:8080/cliente/vendedor/${vendedor.id}'));
//   if (response.statusCode == 200) {
//     final List<dynamic> clientesJson =
//         json.decode(utf8.decode(response.bodyBytes));
//     final List<Cliente> clientes =
//         clientesJson.map((json) => Cliente.fromJson(json)).toList();
//     return clientes;
//   } else {
//     throw Exception('Falha ao carregar os clientes');
//   }
// }

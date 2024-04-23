import 'package:appsupreagro/models/marca.dart';
import 'package:appsupreagro/models/produto_tipo.dart';
import 'package:appsupreagro/models/unidade.dart';
import 'package:appsupreagro/util/jwtHttp.dart';

import 'dart:convert';

import '../util/const.dart';

class Produto {
  int id;
  String marca;
  String unidade;
  String tipoProduto;
  String nome;
  double valor;
  double? valorSelecionado;

  @override
  String toString() {
    return nome;
  }

  Produto({
    required this.id,
    required this.marca,
    required this.unidade,
    required this.tipoProduto,
    required this.nome,
    required this.valor,
    this.valorSelecionado,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        id: json['id'],
        marca: json['marca'],
        unidade: json['unidade'],
        tipoProduto: json['tipoProduto'],
        nome: json['nome'],
        valor: double.tryParse(json['valor'].toString()) ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca.toJson(),
      'unidade': unidade.toJson(),
      'tipoProduto': tipoProduto.toJson(),
      'codigoBarra': codigoBarra,
      'nome': nome,
      'valorCheio': valorCheio,
      'valorDesconto': valorDesconto,
      'unidades': unidades,
      'valorSelecionado': valorSelecionado ?? valorCheio,
    };
  }
}

Future<List<Produto>> carregarProdutos() async {
  //carregar lista de produtos da api em http://localhost:8080/produto
  final response = await http.get(Uri.parse('http://$address:8080/produto'));
  if (response.statusCode == 200) {
    final List<dynamic> produtosJson =
        json.decode(utf8.decode(response.bodyBytes));
    final List<Produto> produtos =
        produtosJson.map((json) => Produto.fromJson(json)).toList();
    return produtos;
  } else {
    throw Exception('Falha ao carregar os produtos');
  }
}

Future<List<Produto>> carregarProdutosPorMarca(int marca) async {
  //carregar lista de produtos da api em http://localhost:8080/produto/marca/
  final response =
      await http.get(Uri.parse('http://$address:8080/produto/marca/$marca'));
  if (response.statusCode == 200) {
    final List<dynamic> produtosJson =
        json.decode(utf8.decode(response.bodyBytes));
    final List<Produto> produtos =
        produtosJson.map((json) => Produto.fromJson(json)).toList();
    return produtos;
  } else {
    throw Exception('Falha ao carregar os produtos');
  }
}

Future<List<Produto>> carregarProdutosPorNome(String nome) async {
  //carregar lista de produtos da api em http://localhost:8080/produto por nome

  final response =
      await http.get(Uri.parse('http://$address:8080/produto/nome/$nome'));
  if (response.statusCode == 200) {
    final List<dynamic> produtosJson =
        json.decode(utf8.decode(response.bodyBytes));
    final List<Produto> produtos =
        produtosJson.map((json) => Produto.fromJson(json)).toList();
    return produtos;
  } else {
    throw Exception('Falha ao carregar os produtos');
  }
}

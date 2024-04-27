class Pedido {
  final int id;
  final String nomeProduto;
  final int quantidade;
  final double valorTotal;
  final String observacao;
  final DateTime dataHora;
  final String formaPagamento;

  Pedido({
    required this.id,
    required this.nomeProduto,
    required this.quantidade,
    required this.valorTotal,
    required this.observacao,
    required this.dataHora,
    required this.formaPagamento,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeProduto': nomeProduto,
      'quantidade': quantidade,
      'valorTotal': valorTotal,
      'observacao': observacao,
      'dataHora': dataHora.toIso8601String(),
      'formaPagamento': formaPagamento,
    };
  }
}

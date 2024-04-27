class Pedido {
 final int id;
 final String nomeProduto;
 final int quantidade;
 final double valorTotal;
 final String observacao;
 final DateTime dataHora;

 Pedido({
    required this.id,
    required this.nomeProduto,
    required this.quantidade,
    required this.valorTotal,
    required this.observacao,
    required this.dataHora, required formaPagamento,
 });

  toMap() {}
}

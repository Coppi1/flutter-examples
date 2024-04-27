enum FormaPagamento {
 cartaoDebito,
 cartaoCredito,
 pix,
 dinheiro,
}

extension FormaPagamentoExtension on FormaPagamento {
 String get nome {
    switch (this) {
      case FormaPagamento.cartaoDebito:
        return 'Cartão de Débito';
      case FormaPagamento.cartaoCredito:
        return 'Cartão de Crédito';
      case FormaPagamento.pix:
        return 'PIX';
      case FormaPagamento.dinheiro:
        return 'Dinheiro';
      default:
        return 'Desconhecido';
    }
 }
}

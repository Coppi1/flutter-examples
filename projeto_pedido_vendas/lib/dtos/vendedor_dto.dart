import 'package:projeto_pedido_vendas/models/vendedor.dart';

class VendedorDTO {
  String? id;
  String nome;
  String telefone;

  VendedorDTO({
    this.id,
    required this.nome,
    required this.telefone,
  });

  // Método para converter de DTO para Entidade
  Vendedor toEntity() {
    return Vendedor(
      id: id,
      nome: nome,
      telefone: telefone,
    );
  }

  // Método para converter de JSON para DTO
  factory VendedorDTO.fromJson(Map<String, dynamic> json) {
    return VendedorDTO(
      id: json['id'] as String?,
      nome: json['nome'] as String,
      telefone: json['telefone'] as String,
    );
  }

  // Método para converter de DTO para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
    };
  }

  @override
  String toString() {
    return 'VendedorDTO(id: $id, nome: $nome, telefone: $telefone)';
  }
}

class ClienteDTO {
  String? id;
  String nome;
  String endereco;
  String cidade;
  String nmrCpfCnpj;
  int vendedorId;

  ClienteDTO({
    this.id,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.nmrCpfCnpj,
    required this.vendedorId,
  });

  // Método para converter de DTO para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'endereco': endereco,
      'cidade': cidade,
      'nmrCpfCnpj': nmrCpfCnpj,
      'vendedorId': vendedorId,
    };
  }

  // Método para converter de JSON para DTO
  factory ClienteDTO.fromJson(Map<String, dynamic> json) {
    return ClienteDTO(
      id: json['id'],
      nome: json['nome'],
      endereco: json['endereco'],
      cidade: json['cidade'],
      nmrCpfCnpj: json['nmrCpfCnpj'],
      vendedorId: json['vendedorId'],
    );
  }

  @override
  String toString() {
    return 'ClienteDTO(id: $id, nome: $nome, endereco: $endereco, cidade: $cidade, nmrCpfCnpj: $nmrCpfCnpj, vendedorId: $vendedorId)';
  }
}

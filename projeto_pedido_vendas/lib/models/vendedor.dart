class Vendedor {
 String? id;
 String nome;
 String telefone;

 Vendedor({
    this.id,
    required this.nome,
    required this.telefone,
 });

 Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
    };
 }
}

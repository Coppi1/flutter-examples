class Pessoa {
  //atributos
  int id;
  String nome;
  DateTime data_nascimento;

  //Metodos
  Pessoa({required this.id, required this.nome, required this.data_nascimento});

  void dormir() {
    print("$nome esta dormindo");
  }
}

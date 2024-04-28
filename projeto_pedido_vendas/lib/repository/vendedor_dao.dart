import 'package:projeto_pedido_vendas/models/vendedor.dart';
import 'package:projeto_pedido_vendas/dtos/vendedor_dto.dart';
import 'package:projeto_pedido_vendas/repository/conexao.dart';
import 'package:sqflite/sqflite.dart';

class VendedorDAO {
  final Conexao conexao = Conexao.instance;

  // Método para inserir um novo vendedor
  Future<int> inserir(Vendedor vendedor) async {
    final db = await conexao.database;
    return await db.insert(
      Conexao.tableVendedor,
      vendedor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Método para buscar todos os vendedores
  Future<List<Vendedor>> buscarTodos() async {
    final db = await conexao.database;
    final List<Map<String, dynamic>> maps =
        await db.query(Conexao.tableVendedor);
    return List.generate(maps.length, (i) {
      return Vendedor(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        telefone: maps[i]['telefone'],
      );
    });
  }

  // Método para buscar um vendedor pelo ID
  Future<Vendedor?> buscarPorId(int id) async {
    final db = await conexao.database;
    final List<Map<String, dynamic>> maps = await db.query(
      Conexao.tableVendedor,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Vendedor(
        id: maps.first['id'],
        nome: maps.first['nome'],
        telefone: maps.first['telefone'],
      );
    }
    return null;
  }

  // Método para atualizar um vendedor
  Future<int> atualizar(Vendedor vendedor) async {
    final db = await conexao.database;
    return await db.update(
      Conexao.tableVendedor,
      vendedor.toMap(),
      where: 'id = ?',
      whereArgs: [vendedor.id],
    );
  }

  // Método para deletar um vendedor
  Future<int> deletar(int id) async {
    final db = await conexao.database;
    return await db.delete(
      Conexao.tableVendedor,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

import 'package:path/path.dart';
import '../models/pedido.dart';


class Database {
 static final _databaseName = "pedidos.db";
 static final _databaseVersion = 1;

 static final table = 'pedidos';

 static const columnId = 'id';
 static const columnNomeProduto = 'nomeProduto';
 static const columnQuantidade = 'quantidade';
 static const columnValorTotal = 'valorTotal';
 static const columnObservacao = 'observacao';
 static const columnDataHora = 'dataHora';
 static const columnFormaPagamento = 'formaPagamento';

 // Singleton class
 Database._privateConstructor();
 static final Database instance = Database._privateConstructor();

 // Database reference
 static Database? _database;
 Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
 }

 // Open the database
 Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
    return _database!;
 }

 // Create the table
 Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNomeProduto TEXT NOT NULL,
            $columnQuantidade INTEGER NOT NULL,
            $columnValorTotal REAL NOT NULL,
            $columnObservacao TEXT,
            $columnDataHora TEXT NOT NULL,
            $columnFormaPagamento TEXT NOT NULL
          )
          ''');
 }

 // Insert a pedido into the database
 Future<int> insert(Pedido pedido, map) async {
    Database db = await instance.database;
    return await db.insert(table as Pedido, pedido.toMap());
 }

 // Get all pedidos
 Future<List<Pedido>> queryAllPedidos() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return Pedido(
        id: maps[i][columnId],
        nomeProduto: maps[i][columnNomeProduto],
        quantidade: maps[i][columnQuantidade],
        valorTotal: maps[i][columnValorTotal],
        observacao: maps[i][columnObservacao],
        dataHora: DateTime.parse(maps[i][columnDataHora]),
        formaPagamento: maps[i][columnFormaPagamento],
      );
    });
 }

 // Update a pedido
 Future<int> update(Pedido pedido, map, {required String where, required List<int> whereArgs}) async {
    Database db = await instance.database;
    return await db.update(table as Pedido, pedido.toMap(),
        where: '$columnId = ?', whereArgs: [pedido.id]);
 }

 // Delete a pedido
 Future<int> delete(int id, {required String where, required List<int> whereArgs}) async {
    Database db = await instance.database;
    return await db.delete(table as int, where: '$columnId = ?', whereArgs: [id]);
 }
 
  getDatabasesPath() {}
  
  openDatabase(String path, {required int version, required Future Function(Database db, int version) onCreate}) {}
  
  execute(String s) {}
  
  query(String table) {}
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  // Inicializa o banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'bancodados.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE usuarios (
            matricula TEXT PRIMARY KEY,
            nome TEXT,
            curso TEXT,
            idade INTEGER
          )
        ''');
      },
    );
  }


  Future<void> inserirUsuario(Map<String, dynamic> usuario) async {
    final db = await database;
    await db.insert("usuarios", usuario, conflictAlgorithm: ConflictAlgorithm.replace);
  }


  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await database;
    return await db.query("usuarios");
  }

  Future<void> excluirUsuario(String matricula) async {
    final db = await database;
    await db.delete("usuarios", where: "matricula = ?", whereArgs: [matricula]);
  }

  Future<void> atualizarUsuario(String matricula, Map<String, dynamic> usuario) async {
    final db = await database;
    await db.update("usuarios", usuario, where: "matricula = ?", whereArgs: [matricula]);
  }
}

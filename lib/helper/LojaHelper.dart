
import 'package:app_gaya/model/Loja.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class LojaHelper {
  static final String nomeTabela = "loja";
 
  static final LojaHelper _lojaHelper = LojaHelper._internal();
  Database? _db;
 
  factory LojaHelper() {
    return _lojaHelper;
  }
 
  LojaHelper._internal() {}
 
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }
 
  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "razao_social VARCHAR, "
        "cnpj VARCHAR, "
        "nome_fantasia VARCHAR, "
        "telefone VARCHAR, "
        "celular VARCHAR, "
        "cep VARCHAR, "
        "estado VARCHAR, "
        "cidade VARCHAR, "
        "endereco VARCHAR, "
        "descricao VARCHAR, "
        "segmento VARCHAR, "
        "complemento DATETIME)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_tarefas.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarLoja(Loja loja) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, loja.toMap());
    return resultado;
  }
 
  recuperarLojas() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY razao_social DESC ";
    List tarefas = await bancoDados.rawQuery(sql);
    return tarefas;
  }
 
  Future<int> atualizarLoja(Loja loja) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, loja.toMap(),
        where: "id = ?", whereArgs: [loja.id]);
  }
 
  Future<int> removerLoja(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}

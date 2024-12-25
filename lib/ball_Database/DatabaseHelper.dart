import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LogDatabaseHelper {
  static final databaseName = "lottolog.db";
  static final _databaseVersion = 1;

  // Table names
  /**645 테이블 이름 */
  static final table645Name = "table645";
  /**720 테이블 이름 */
  static final table720Name = "table720";
  static final logTable645 = "user_645log";
  static final logTable720 = "user_720log";

  // Columns for 6/45
  static final columnId645 = "id";
  static final columnPrize645_1 = "prize1";
  static final columnPrize645_2 = "prize2";
  static final columnPrize645_3 = "prize3";
  static final columnPrize645_4 = "prize4";
  static final columnPrize645_5 = "prize5";
  static final columnPrize645_6 = "prize6";
  static final columnBonus645 = "bonus";
  static final prizeMoney = "prizeMoney";

  // Columns for 720+
  static final columnId720 = "id";
  static final columnPrize720_1 = "prize1";
  static final columnPrize720_2 = "prize2";
  static final columnPrize720_3 = "prize3";
  static final columnPrize720_4 = "prize4";
  static final columnPrize720_5 = "prize5";
  static final columnPrize720_6 = "prize6";
  static final columnPrize720_7 = "prize7";
  static final columnBonus720 = "bonus";


  // Columns for user logs 645
  static final columnUserId645 = "id";
  static final columnUserDateId645 = "date_id";
  static final columnUserChoice645_1 = "choice1";
  static final columnUserChoice645_2 = "choice2";
  static final columnUserChoice645_3 = "choice3";
  static final columnUserChoice645_4 = "choice4";
  static final columnUserChoice645_5 = "choice5";
  static final columnUserChoice645_6 = "choice6";

  // Columns for user logs 720
  static final columnUserId720 = "id";
  static final columnUserDateId720 = "date_id";
  static final columnUserChoice720_1 = "choice1";
  static final columnUserChoice720_2 = "choice2";
  static final columnUserChoice720_3 = "choice3";
  static final columnUserChoice720_4 = "choice4";
  static final columnUserChoice720_5 = "choice5";
  static final columnUserChoice720_6 = "choice6";
  static final columnUserChoice720_7 = "choice7";

  // Singleton pattern
  LogDatabaseHelper._privateConstructor();
  static final LogDatabaseHelper instance = LogDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Create tables
  Future _onCreate(Database db, int version) async {

    // Create result table for 6/45
    await db.execute('''
      CREATE TABLE $table645Name (
        $columnId645 INTEGER PRIMARY KEY,
        $columnPrize645_1 INTEGER,
        $columnPrize645_2 INTEGER,
        $columnPrize645_3 INTEGER,
        $columnPrize645_4 INTEGER,
        $columnPrize645_5 INTEGER,
        $columnPrize645_6 INTEGER,
        $columnBonus645 INTEGER,
        $prizeMoney TEXT
      )
    ''');

    // Create result table for 720
    await db.execute('''
      CREATE TABLE $table720Name (
        $columnId720 INTEGER PRIMARY KEY,
        $columnPrize720_1 TEXT,
        $columnPrize720_2 TEXT,
        $columnPrize720_3 TEXT,
        $columnPrize720_4 TEXT,
        $columnPrize720_5 TEXT,
        $columnPrize720_6 TEXT,
        $columnPrize720_7 TEXT,
        $columnBonus720 TEXT
      )
    ''');


    // Create user log table for 6/45
    await db.execute('''
      CREATE TABLE $logTable645 (
        $columnUserId645 INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUserDateId645 INTEGER,
        $columnUserChoice645_1 INTEGER,
        $columnUserChoice645_2 INTEGER,
        $columnUserChoice645_3 INTEGER,
        $columnUserChoice645_4 INTEGER,
        $columnUserChoice645_5 INTEGER,
        $columnUserChoice645_6 INTEGER
      )
    ''');

    // Create user log table for 720
    await db.execute('''
      CREATE TABLE $logTable720 (
        $columnUserId720 INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUserDateId720 INTEGER,
        $columnUserChoice720_1 TEXT,
        $columnUserChoice720_2 TEXT,
        $columnUserChoice720_3 TEXT,
        $columnUserChoice720_4 TEXT,
        $columnUserChoice720_5 TEXT,
        $columnUserChoice720_6 TEXT,
        $columnUserChoice720_7 TEXT
      )
    ''');
  }

  // Upgrade database
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      await db.execute("DROP TABLE IF EXISTS $logTable645");
      await db.execute("DROP TABLE IF EXISTS $logTable720");
      await db.execute("DROP TABLE IF EXISTS $table645Name");
      await db.execute("DROP TABLE IF EXISTS $table720Name");
      _onCreate(db, newVersion);
    }
  }
}

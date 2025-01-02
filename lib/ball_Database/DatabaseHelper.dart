import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LogDatabaseHelper {
  static const databaseName = "lottolog.db";
  static const _databaseVersion = 1;

  // Table names
  /**645 테이블 이름 */
  static const table645Name = "table645";
  /**720 테이블 이름 */
  static const table720Name = "table720";
  static const logTable645 = "user_645log";
  static const logTable720 = "user_720log";

  // Columns for 6/45
  static const columnId645 = "id";
  static const columnPrize645_1 = "prize1";
  static const columnPrize645_2 = "prize2";
  static const columnPrize645_3 = "prize3";
  static const columnPrize645_4 = "prize4";
  static const columnPrize645_5 = "prize5";
  static const columnPrize645_6 = "prize6";
  static const columnBonus645 = "bonus";
  static const prizeMoney = "prizeMoney";

  //추가용
  static const columnPrize645_ = "prize";

  // Columns for 720+
  static const columnId720 = "id";
  static const columnPrize720_1 = "prize1";
  static const columnPrize720_2 = "prize2";
  static const columnPrize720_3 = "prize3";
  static const columnPrize720_4 = "prize4";
  static const columnPrize720_5 = "prize5";
  static const columnPrize720_6 = "prize6";
  static const columnPrize720_7 = "prize7";
  static const columnBonus720 = "bonus";


  // Columns for user logs 645
  static const columnUserId645 = "id";
  static const columnUserDateId645 = "date_id";
  static const columnUserChoice645_1 = "choice1";
  static const columnUserChoice645_2 = "choice2";
  static const columnUserChoice645_3 = "choice3";
  static const columnUserChoice645_4 = "choice4";
  static const columnUserChoice645_5 = "choice5";
  static const columnUserChoice645_6 = "choice6";

  // Columns for user logs 720
  static const columnUserId720 = "id";
  static const columnUserDateId720 = "date_id";
  static const columnUserChoice720_1 = "choice1";
  static const columnUserChoice720_2 = "choice2";
  static const columnUserChoice720_3 = "choice3";
  static const columnUserChoice720_4 = "choice4";
  static const columnUserChoice720_5 = "choice5";
  static const columnUserChoice720_6 = "choice6";
  static const columnUserChoice720_7 = "choice7";

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

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDBHelper {
  // make this a singleton class
  SqliteDBHelper._privateConstructor();
  static final SqliteDBHelper instance = SqliteDBHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    final path = await getDatabasesPath();
    return await openDatabase(join(path, "student_attendance.db"),
        version: 1, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    db.execute('''
          CREATE TABLE "class" (
	          "C_classId"	TEXT,
	          "C_className"	TEXT NOT NULL,
	          "C_semester"	INTEGER NOT NULL,
	          "C_year"	INTEGER NOT NULL,
	          "C_numberOfStudent"	INTEGER NOT NULL,
	          PRIMARY KEY("C_classId")
          );
          ''');

    db.execute('''
            CREATE TABLE "student" (
	          "S_mssv"	TEXT NOT NULL,
	          "S_name"	TEXT,
	          "S_email"	TEXT,
	          "S_phone"	TEXT,
	          PRIMARY KEY("S_mssv")
          );
''');

    db.execute('''
          CREATE TABLE "lesson" (
	          "L_Id"	INTEGER,
	          "L_name"	TEXT NOT NULL,
	          "L_teacherName"	TEXT NOT NULL,
	          "L_createDate"	TEXT NOT NULL,
	          "L_attendanceDate"	TEXT NOT NULL,
	          "L_C_classId"	TEXT,
	          FOREIGN KEY("L_C_classId") REFERENCES "class"("C_classId") ON DELETE CASCADE,
	          PRIMARY KEY("L_Id" AUTOINCREMENT)
          );
''');

    db.execute('''
          CREATE TABLE "studentinclass" (
	          "SiC_C_classId"	TEXT NOT NULL,
	          "SiC_S_mssv"	TEXT NOT NULL,
	          FOREIGN KEY("SiC_S_mssv") REFERENCES "student"("S_mssv") ON DELETE CASCADE,
	          FOREIGN KEY("SiC_C_classId") REFERENCES "class"("C_classId") ON DELETE CASCADE,
          	PRIMARY KEY("SiC_C_classId","SiC_S_mssv")
          );
''');

    db.execute('''
          CREATE TABLE "attendance" (
	          "A_L_lessonId"	INTEGER NOT NULL,
	          "A_S_mssv"	TEXT NOT NULL,
	          FOREIGN KEY("A_S_mssv") REFERENCES "student"("S_mssv") ON DELETE CASCADE,
	          FOREIGN KEY("A_L_lessonId") REFERENCES "lesson"("L_Id") ON DELETE CASCADE,
	          PRIMARY KEY("A_L_lessonId","A_S_mssv")
          );
''');
  }
}

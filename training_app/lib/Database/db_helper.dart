import 'package:sqflite/sqflite.dart';
import 'package:training_app/models/company.dart';
import 'package:training_app/models/student.dart';

class DatabaseHelper {
  static late Database db;
  static String createOrganization = '''
        CREATE TABLE IF NOT EXISTS "Organization" (
          "comp_id"	INTEGER NOT NULL, 
          "comp_name"	INTEGER NOT NULL, 
          "Specialization"	TEXT NOT NULL, 
          "e_mail"	INTEGER NOT NULL UNIQUE, 
          "capacity"	INTEGER NOT NULL, 
          "training_period"	INTEGER NOT NULL, 
          "telephone"	TEXT NOT NULL UNIQUE, 
          "supervisor"	INTEGER NOT NULL, 
          "address"	TEXT NOT NULL, 
          PRIMARY KEY("comp_id" AUTOINCREMENT)
        )
      ''';
  static String createStudent = '''
        CREATE TABLE IF NOT EXISTS "Student" (
          "stud_id"	INTEGER NOT NULL, 
          "comp_id"	INTEGER, 
          "stud_name"	TEXT NOT NULL, 
          "e_mail"	REAL NOT NULL UNIQUE, 
          "department"	TEXT NOT NULL, 
          "gpa"	INTEGER NOT NULL, 
          "grade"	TEXT NOT NULL, 
          "telephone"	TEXT NOT NULL, 
          FOREIGN KEY("comp_id") REFERENCES "Organization"("comp_id"), 
          PRIMARY KEY("stud_id" AUTOINCREMENT)
        )
      ''';

  static void connectDB() async {
    db = await openDatabase(
      // 'dataFile.db',
      'file1.db',
      version: 1,
      onCreate: (db, _) async {
        print("Created");
        await db.execute(createOrganization);
        await db.execute(createStudent);
      },
      onOpen: (db) async {
        print("Opened");
        // await addCompany1(db, ['Google', 'Computer', 'google@gmail.com', '2000', '60', '0528206', 'Mr. Malek', 'USA']);
        // await addCompany1(db, ['Vodafone', 'Comunication', 'vodafone@gmail.com', '800', '20', '0223366', 'Mr. Kamal', 'Nasr City']);
        // await addCompany1(db, ['El Mokauloon', 'Michanics', 'mokaul@gmail.com', '5000', '30', '0896523', 'Mr. Tamer', 'Cairo']);
        // await addCompany1(db, ['Software Solutions', 'Computer', 'soft@gmail.com', '1000', '45', '0853674', 'Mrs. Esraa', 'Elmaadi']);
      },
    );
  }

  static Future<int> addStudent(Student student) async {
    return await db.insert('Student', student.toJson());
  }

  static Future<void> addCompany(List<String> params) async {
    String insertcmd = '''
        INSERT INTO Organization ("comp_name", "Specialization", "e_mail", "capacity", "training_period", "telephone", "supervisor", "address") 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?);
      ''';
    await db.execute(insertcmd, params);
  }

  static Future<void> addCompany1(Database newdb, List<String> params) async {
    String insertcmd = '''
        INSERT INTO Organization ("comp_name", "Specialization", "e_mail", "capacity", "training_period", "telephone", "supervisor", "address") 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?);
      ''';
    await newdb.execute(insertcmd, params);
  }

  static Future<int> updateCompany(Company company) async {
    return await db.update('Organization', company.toJson(),
        where: 'comp_id = ?', whereArgs: [company.compId]);
  }

  static Future<int> deleteCompany(Company company) async {
    return await db.delete('Organization',
        where: 'comp_id = ?', whereArgs: [company.compId]);
  }

  static Future<List<Company>?> getAllCompaines() async {
    final List<Map<String, dynamic>> companyList =
        await db.query('Organization');

    if (companyList.isEmpty) return null;

    return List.generate(
      companyList.length,
      (index) => Company.fromJson(companyList[index]),
    );
  }

  static Future<List<Student>?> getAllStudents() async {
    final List<Map<String, dynamic>> studentList = await db.query('Student');

    if (studentList.isEmpty) return null;

    return List.generate(
      studentList.length,
      (index) => Student.fromJson(studentList[index]),
    );
  }
}

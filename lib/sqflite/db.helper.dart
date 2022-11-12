import 'package:sqflite/sqflite.dart';
import '../constants/List.dart';
import '../constants/famous_variable.dart';

class DataBaseHelper {
  Database? database;

  createDataBase() async {
    database = await openDatabase('myNote.db', version: 2,
        onCreate: (Database db, int version) async {
          print('database created'); //first time
          // When creating the db, create the table
          await db
              .execute(
              'CREATE TABLE mynote (id INTEGER PRIMARY KEY, title TEXT, task TEXT, time TEXT, date TEXT)')
              .then((value) {
            print('table is created');//first time
          }).catchError((error) {
            print('Error when creating Table $error');
          });
        },
        onOpen: (Database){
          print(' database opened');//first time
         getDataFromDataBase(Database);
        }
    );
  }
  Future insertToDataBase({required String title ,required String task ,required String time ,required String date ,})async{

    return await database!.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO mynote(title,task,time,date) VALUES("$title","$task","$time","$date")').then((value) {
        print('$value inserted successfully ');
      }).catchError((e){
        print(' Error When Inserting New Record $e');
      });
      print('inserted ');

    }) ;
  }
  getDataFromDataBase(database ) async {

    data = await database.rawQuery('SELECT * FROM mynote');
    print(data);
    if(data.isEmpty){
      print("empty");
      empty=true;
    }
    else if(data.isNotEmpty){
      print("not empty");
      empty=false;
    }

  }
  updateData({required String title ,required String task ,required String time ,required String date,required int myId }) async {
    await database!.rawUpdate('UPDATE user SET title = ? WHERE id = ?',
    [title, myId] );

   return getDataFromDataBase(database);

  }
  deleteData({required int check}) async {
    await database!.rawDelete(
        'DELETE FROM mynote WHERE id = ?',[check]);

  }
}
import 'dart:io';
import 'package:tbmfm/screens/login/thansetions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransationDB {
  String? dbName;

  TransationDB({this.dbName});

  Future<Database> openDatabase() async {
    //ค้นหาตำแหน่งจัดเก็บ
    Directory appDirectory = await getApplicationDocumentsDirectory();

    String dbLocation = join(appDirectory.path, dbName);

    //ถ้าค้นหาตำปหน่งไม่เจอ ให้ทำการสร้างใหม่

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  Future<int> Insertdata(Transations statemet) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    //เก็บข้อมูลลงในStore ในรูปแบบ JSON
    var keyID = store.add(db, {
      'title': statemet.title,
      'amount': statemet.amount,
      'date': statemet.date.toIso8601String()
    });
    db.close();
    return keyID;
  }

  //ดึงข้อมูลมาแสดง
  Future<List<Transations>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List transationList = List<Transations>();
    for (var record in snapshot) {
      transationList.add(Transations(
          title: record['title'],
          amount: record['amount'],
          date: DateTime.parse(record['date'])));
    }
    return transationList;
  }
}

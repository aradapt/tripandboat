import 'package:flutter/foundation.dart';
import 'package:tbmfm/screens/login/db.dart';
import 'package:tbmfm/screens/login/thansetions.dart';

class TransationProvider with ChangeNotifier {
  List<Transations> transation = [];

  //ดึงข้อมูล
  List<Transations> getThansation() {
    return transation;
  }

  //เตรียมข้อมูลไว้รอตอนเปิดแอพ
  void initData() async {
    //ดึงข้อมูลมาจากdatabase
    var db = TransationDB(dbName: 'transation.db');
    //ดึงข้อมูลมารอแสดงผล
    transation = await db.loadAllData();
    //แจ้งconsumer
    notifyListeners();
  }

  //เพิ่มข้อมูล
  void addTransation(Transations statement) async {
    //ดึงข้อมูลมาจากdatabase
    var db = TransationDB(dbName: 'transation.db');
    //บันทึก
    await db.Insertdata(statement);
    //ดึงข้อมูลมารอแสดงผล
    transation = await db.loadAllData();
    //แจ้งconsumer
    notifyListeners();
  }
}

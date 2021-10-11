import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tbmfm/screens/login/thansetions.dart';
import 'package:tbmfm/screens/login/transaction_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransationProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormModel();
                  }));
                })
          ],
        ),
        //เรียกใช้ ListView.builder เพื่อแสดงรายการแบบไม่จำกัดขอบเขต
        body: Consumer(
            builder: (context, TransationProvider provider, Widget child) {
          var count = provider.transation.length;
          if (count <= 0) {
            return Center(
              child: Text('ไม่พบข้อมูล'),
            );
          } else {
            return ListView.builder(
                itemCount: count,
                itemBuilder: (context, int index) {
                  Transations data = provider.transation[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: Text(data.amount.toString()),
                        ),
                      ),
                      title: Text(data.title),
                      subtitle:
                          Text(DateFormat('dd/MM/yyyy').format(data.date)),
                    ),
                  );
                });
          }
        }));
  }
}

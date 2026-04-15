import 'package:firebase_database/firebase_database.dart';

class KaryawanSevice {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('home_screen');
  Stream<Map<String, String>> getHomeScreen(){
    return database.onValue.map((event){
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;
      print('snapshot data: ${snapshot.value}');
      if(snapshot.value != null){
        Map<dynamic, dynamic> values = snapshot.value as map<dynamic, dynamic>;
        values.forEach((key, value){

        });
      }
    });
  }

}
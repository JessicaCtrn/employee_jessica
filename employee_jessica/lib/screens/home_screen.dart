import 'package:flutter/material.dart';
import 'package:employee_jessic
a/services/karyawan_service.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  final TextEditingController _controller = TextEditingController();
  final KaryawanService _karyawanService = KaryawanService();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Karyawan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Tambah Karyawan'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: (){
                    _karyawanService.addKaryawanService(_controller.text);
                    _controller.clear();
                  }
                )
              ],
            ),
          )
          Expanded(
            child: StreamBuilder<Map<String, String>>(
              stream: _karyawanService.gethomescreen(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  Map<String, String>items = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      final key = items.keys.elementAt(index);
                      final item = items[key];
                      return ListTile(
                        title: Text(item!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: (){
                            _karyawanService.removeDaftarKaryawan(key);
                          },
                        ),
                      );
                    }
                  );
                } else if (snapshot.hasError){
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            )
          )
        ],
      ),
    );
  }
}

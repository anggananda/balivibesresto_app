import 'package:balivibesresto_app/pages/detail.dart';
import 'package:balivibesresto_app/pages/drawer.dart';
import 'package:balivibesresto_app/pages/keranjang.dart';
import 'package:balivibesresto_app/utils/var_global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.transparent,
        child: DrawerScren(),
      ),
      appBar: AppBar(
        title: Text('Home'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                const Color.fromARGB(255, 100, 217, 246),
                Colors.blueAccent,
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: VarGlobal.data.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    img: VarGlobal.data[index]['img'],
                    title: VarGlobal.data[index]['title'],
                    deskripsi: VarGlobal.data[index]['deskripsi'],
                    harga: VarGlobal.data[index]['harga'],
                  ),
                ));
          },
          child: Container(
            height: 120,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ]),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      VarGlobal.data[index]['img'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        VarGlobal.data[index]['title'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        VarGlobal.data[index]['deskripsi'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          VarGlobal.data[index]['harga'],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Keranjang(),
                ));
          }),
    );
  }
}
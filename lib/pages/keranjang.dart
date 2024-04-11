import 'package:balivibesresto_app/pages/drawer.dart';
import 'package:flutter/material.dart';
import '../utils/var_global.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.transparent,
        child: DrawerScren(),
      ),
      appBar: AppBar(
        title: Text('Keranjang'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(25),
        itemCount: VarGlobal.keranjang.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DetailPage(
            //         img: VarGlobal.data[index]['img'],
            //         title: VarGlobal.data[index]['title'],
            //         deskripsi: VarGlobal.data[index]['deskripsi'],
            //         harga: VarGlobal.data[index]['harga'],
            //       ),
            //     ));
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
                      VarGlobal.keranjang[index]['img'],
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
                        VarGlobal.keranjang[index]['title'],
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        VarGlobal.keranjang[index]['harga'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

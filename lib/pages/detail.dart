import 'package:balivibesresto_app/pages/keranjang.dart';
import 'package:balivibesresto_app/pages/pembayaran.dart';
import 'package:balivibesresto_app/utils/var_global.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String img, title, deskripsi, harga;

  const DetailPage(
      {super.key,
      required this.img,
      required this.title,
      required this.deskripsi,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      deskripsi,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        'Harga',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            harga,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: InkWell(
                onTap: () {
                  VarGlobal.keranjang.addAll([
                    {
                      'img': img,
                      'title': title,
                      'harga': harga,
                    }
                  ]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PembayaranPage(),
                      ));
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text('Pesan & Bayar',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow()],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue, Colors.blue.shade200])),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Keranjang(),
                          ),
                          (route) => false);
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    )))
          ],
        ),
      ),
    );
  }
}

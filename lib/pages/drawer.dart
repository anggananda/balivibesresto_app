import 'package:balivibesresto_app/pages/home.dart';
import 'package:balivibesresto_app/pages/keranjang.dart';
import 'package:balivibesresto_app/pages/login.dart';
import 'package:balivibesresto_app/pages/profile.dart';
import 'package:flutter/material.dart';

class DrawerScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment(0.0, 0.1),
          colors: [Colors.white.withOpacity(0.8), Colors.white], //
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/Balinese.jpeg'),
            ),
          ),
          ListTile(
            title: const Text('Latihan API'),
            onTap: () {
              Navigator.pushNamed(context, '/newsscreen');
            },
          ),
          ListTile(
            title: const Text('Latihan SQLite'),
            onTap: () {
              Navigator.pushNamed(context, '/test');
            },
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Keranjang'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Keranjang(),
                  ));
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Logout',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                )
              ],
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

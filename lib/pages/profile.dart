import 'package:balivibesresto_app/pages/drawer.dart';
import 'package:balivibesresto_app/pages/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.transparent,
        child: DrawerScren(),
      ),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/Profil.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Nama :',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Made Ganggasvaranandha Yudistira',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Kelahiran :',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Mekarsari, 01-09-2004',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Alamat :',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Jl. Bangau No.4, Kaliuntu, Kec.Buleleng, Kab. Buleleng',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'No. Telp :',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '082236656064',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ],
          )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'Ingin Logout?',
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              },
            ).show();
          },
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ),
      ),
    );
  }
}
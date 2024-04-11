// ignore_for_file: invalid_use_of_protected_member, unused_import

import 'dart:io';

import 'package:balivibesresto_app/pages/food_screen.dart';
import 'package:balivibesresto_app/pages/login.dart';
import 'package:balivibesresto_app/pages/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  assert(binding.debugCheckZone('runApp'));
  binding
    ..scheduleAttachRootWidget(binding.wrapWithDefaultView(const MyApp()))
    ..scheduleWarmUpFrame();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: LoginPage(),
      routes: {
        '/newsscreen': (context) =>  const NewsScreen(),
        '/test': (context) =>  const FoodScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

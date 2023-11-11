import 'package:flutter/material.dart';
import 'package:prj_wisatacandisi51_flutterpert3/data/candi_data.dart';
import 'package:prj_wisatacandisi51_flutterpert3/screens/search_screen.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/detail_screen.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/profile_info_item.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/profile_screen.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/signin_screen.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/signup_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color : Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: 
        ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      home: SearchScreen(),
    );
  }
}

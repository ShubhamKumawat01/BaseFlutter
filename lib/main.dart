import 'package:day/pages/home_page.dart';
import 'package:day/pages/login_page.dart';
import 'package:day/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //  int days=30;
    // String name="ITRES";
  //  double pi=3.14;
  //  num temp=30.5;// it can take a value int and double

    var day=5;//automatically get by compiler
    const pii=3.14;//constant value

    return MaterialApp(
      //home: HomePage(),//initial route but define in routes so one take comment
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        fontFamily : GoogleFonts.lato().fontFamily,
      ),
      routes: {
        "/":(context)=>LoginPage(),
        MyRoutes.homeRoute:(context)=>HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage()
      },
    );
  }
}

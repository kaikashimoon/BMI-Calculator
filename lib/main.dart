import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
    Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0A0E21)
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
      ),
      home: InputPage(),
    );
  }

}

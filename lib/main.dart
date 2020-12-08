import 'package:competicoes_futebol_tabelas/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabelas de Competições de Futebol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

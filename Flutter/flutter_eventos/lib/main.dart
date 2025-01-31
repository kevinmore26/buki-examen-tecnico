import 'package:flutter/material.dart';
import 'screens/evento_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventos App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: EventoFormScreen(),
    );
  }
}

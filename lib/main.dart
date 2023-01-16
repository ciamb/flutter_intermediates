import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter - Intermediates Course'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(children: const [
          Text('Questo è il corso Flutter - Intermediate!! :D')
        ]),
      ),
    );
  }
}

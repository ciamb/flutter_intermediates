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
  String mystring = '';

  void onClick() => setState(() => mystring = DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Il Tooltip!')),
      body: Center(
        child: Column(children: [
          const Text('Scorri sopra l\' iconButton e scoprirai cosa è il tooltip!'),
          IconButton(
            onPressed: onClick,
            icon: const Icon(Icons.date_range_outlined), 

            // Il tooltip non è altro che una proprietà dei bottoni in generale!
            tooltip: 'Clicca per sapere la data esatta!',
            ),
          Text(mystring)
        ]),
      ),
    );
  }
}

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
  int counter = 0;
  List<Widget> list = <Widget>[];

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = newItem(i);
      list.add(child);
    }
    super.initState();
  }

  // In questo metodo creo un nuovo widget ogni volta che clicco il bottone a cui questa 
  // funzione è associata passandogli il contatore come paramentro di ingresso
  // e successivamente lo aggiungo alla lista.
  void onClicked() {
    Widget child = newItem(counter);
    setState(() => list.add(child));
  }

  // Il newItem() non fa altro che creare un nuovo widget di tipo Container con varie proprietà settate.
  Widget newItem(int i) {
    Key key = Key('Item $i');
    Container child = Container(
      // La chiave permette di dare una referenza all ' oggetto , quindi sarebbe un identificatore!
      key: key,
      padding: const EdgeInsets.all(16.0),
      child: Chip(
        label: Text('$i° Widget.'),
        deleteIconColor: Colors.pink,
        deleteButtonTooltipMessage: 'Cancella!',
        onDeleted: () => removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Text(i.toString()),
        ),
      ),
    );
    counter++;
    return child;
  }

  // Tramite il removeItem() vado invece ad eliminare il widget dalla lista.
  // Come parametro in ingresso accetta una key che fa da identificatore per il widget 
  // che sto eliminando.
  void removeItem(Key key) {
    for (int i = 0; i < list.length; i++) {
      Widget child = list.elementAt(i);
      if (child.key == key) {
        setState(() => list.removeAt(i));
        print('Stai rimuovendo ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Template')),
      floatingActionButton: FloatingActionButton(
        onPressed: onClicked,
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: list
          ),
      ),
    );
  }
}

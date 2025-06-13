// Application avec navigation vers plusieurs Exercices

import 'package:flutter/material.dart';
import 'ex1.dart';
import 'ex2.dart';
import 'ex3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 4',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent)
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home>{

  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("TP5 – Application multi-écrans Flutter")),
    FormPage(),  // Classe de l'exercice 1
    MyPage(),  // Classe de l'exercice 2
    DynamicListScreen(),  // Classe de l'exercice 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        backgroundColor: Colors.lightGreen,
      ),
      // Option 1 : Avec Drawer
      //drawer: Drawer(
      //         child: ListView(
      //           padding: EdgeInsets.zero,
      //           children: [
      //             DrawerHeader(
      //               decoration: BoxDecoration(
      //                 color: Colors.lightGreen,
      //               ),
      //               child: Text('Menu de navigation'),
      //             ),
      //             ListTile(
      //               title: Text('Accueil'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 0;
      //                 });
      //                 Navigator.pop(context);
      //               },
      //             ),
      //             ListTile(
      //               title: Text('EX1 - Formulaire'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 1;
      //                 });
      //                 Navigator.pop(context);
      //               },
      //             ),
      //             ListTile(
      //               title: Text('EX2 - Image'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 2;
      //                 });
      //                 Navigator.pop(context);
      //               },
      //             ),
      //             ListTile(
      //               title: Text('EX3 - Liste'),
      //               onTap: () {
      //                 setState(() {
      //                   _currentIndex = 3;
      //                 });
      //                 Navigator.pop(context);
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //       body: _screens[_currentIndex],
      body: // Option 2 :
      _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'EX1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'EX2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'EX3',
          ),
        ],
        selectedItemColor: Colors.lightGreen,
      ),
    );
  }
}
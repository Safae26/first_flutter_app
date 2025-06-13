import 'package:flutter/material.dart';
import 'ex1.dart';
import 'ex2.dart';
import 'ex3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB5EAD7),
          primary: const Color(0xFFC7CEEA),
          secondary: const Color(0xFFFFDAC1),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(
      child: Text(
        'Application multi-écrans Flutter',
        style: TextStyle(fontSize: 24),
      ),
    ),
    FormPage(),
    MyPage(),
    DynamicListScreen(),
  ];

  final List<String> _titles = const [
    'Accueil',
    'Formulaire d\'inscription',
    'Image avec interactions',
    'Liste dynamique',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: const Color(0xFFA2C7E5),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFFA2C7E5),
              ),
              child: Text(
                'Menu de navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ..._buildDrawerItems(),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
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
        selectedItemColor: const Color(0xFF6B8EAC),
        unselectedItemColor: const Color(0xFFC1CDD9),
        backgroundColor: const Color(0xFFE8F4F8),
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    return List.generate(_screens.length, (index) {
      return ListTile(
        leading: Icon(
          index == 0
              ? Icons.home
              : index == 1
              ? Icons.assignment
              : index == 2
              ? Icons.image
              : Icons.list,
        ),
        title: Text(_titles[index]),
        onTap: () {
          setState(() => _currentIndex = index);
          Navigator.pop(context);
        },
      );
    });
  }
}
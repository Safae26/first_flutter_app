//Gestion dynamique d’une liste avec Checkbox et suppression conditionnelle

import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 3',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent)
      ),
      home: DynamicListScreen(),
    );
  }
}

class DynamicListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DynamicListScreen();
  
}

class _DynamicListScreen extends State<DynamicListScreen>{

  final TextEditingController _nameController = TextEditingController();
  final List<String>? noms = [];
  final List<Map<String, dynamic>> _items = [];

  void _toggleItem(int index) {
    setState(() {
      _items[index]['isSelected'] = !_items[index]['isSelected'];
    });
  }

  void _addItem() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _items.add(
          {
            'name' : _nameController.text,
            'isSelected' : false
          }
        );
      });
      _nameController.clear();
    }
  }

  void _deleteItem(index) {
    if (_items[index]['isSelected']==true) {
      setState(() {
        _items.removeAt(index);
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner l\'élément avant de le supprimer'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste dynamique'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom et Prenom',
                hintText: 'Entrez votre Nom et Prenom',
              ),
            ),
            SizedBox(height: 10),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _addItem,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: _items[index]['isSelected'],
                      onChanged: (bool? value) {
                        _toggleItem(index);
                      },
                    ),
                    title: Text(_items[index]['name']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteItem(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
// Exercice 3 : Liste dynamique avec Checkbox
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercice 3',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFC7CEEA),
            primary: const Color(0xFFD8BFD8),
            secondary: const Color(0xFFE6E6FA),
          ),
        ),
        home: const DynamicListScreen(),
    );
  }
}

class DynamicListScreen extends StatefulWidget {
  const DynamicListScreen({super.key});

  @override
  State<DynamicListScreen> createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<Map<String, dynamic>> _items = [];

  void _toggleItem(int index) {
    setState(() {
      _items[index]['isSelected'] = !_items[index]['isSelected'];
    });
  }

  void _addItem() {
    final text = _nameController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _items.add({
          'name': text,
          'isSelected': false,
        });
      });
      _nameController.clear();
    }
  }

  void _deleteItem(int index) {
    if (_items[index]['isSelected']) {
      setState(() {
        _items.removeAt(index);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner l\'élément avant de le supprimer'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom et Prénom',
                hintText: 'Entrez votre Nom et Prénom',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addItem(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Ajouter'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFFF0E6FF),
                    child: ListTile(
                      leading: Checkbox(
                        value: _items[index]['isSelected'],
                        onChanged: (bool? value) {
                          _toggleItem(index);
                        },
                      ),
                      title: Text(_items[index]['name']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Color(0xFFFF746C)),
                        onPressed: () => _deleteItem(index),
                      ),
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
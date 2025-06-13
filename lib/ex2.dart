// Exercice 2 : Image avec Likes/Dislikes et Commentaires
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercice 2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFFB7B2),
            primary: const Color(0xFFFFDAC1),
            secondary: const Color(0xFFFFF4C4),
          ),
        ),
        home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _likesCount = 0;
  int _dislikesCount = 0;
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text.trim());
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16.0)),
            Image.network(
              'https://picsum.photos/500/300',
              width: 500,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: const Color(0xFF88D8C0)),
                    onPressed: () => setState(() => _likesCount++),
                  ),
                  Text('$_likesCount'),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.thumb_down, color: const Color(0xFFFF6B6B)),
                    onPressed: () => setState(() => _dislikesCount++),
                  ),
                  Text('$_dislikesCount'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Ajouter un commentaire...',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _addComment(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addComment,
                    child: const Text('Commenter'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Commentaires',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.comment),
                  title: Text(_comments[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
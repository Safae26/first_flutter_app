//Affichage d'une image avec Likes/Dislikes et Commentaires
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)
      ),
      home: MyPage(),
    );
  }
  
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  int compteurLikes = 0;
  int compteurDislikes = 0;
  final TextEditingController _commentController = TextEditingController();
  final List<String>? commentaires = [];

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text('Image avec Interactions'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Image.network(
              'https://picsum.photos/500/300'
          ),
          // Boutons Like/Dislike
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up, color: Colors.green),
                  onPressed: () {
                    setState(() {
                      compteurLikes++;
                    });
                  },
                ),
                Text('$compteurLikes'),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.thumb_down, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      compteurDislikes++;
                    });
                  },
                ),
                Text('$compteurDislikes'),
              ],
            ),
          ),
          // Champ d'ajout de commentaire
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Ajouter un commentaire...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _ajouterCommentaire(),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _ajouterCommentaire,
                  child: Text('Commenter'),
                ),
              ],
            ),
          ),
          // Titre Commentaires
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

          // Liste des commentaires
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: commentaires?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.comment),
                title: Text(commentaires![index]),
              );
            },
          ),
        ],
      ),
    );
  }

  void _ajouterCommentaire() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        commentaires!.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }


}
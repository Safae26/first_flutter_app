// Création d’un formulaire simple
// Points essentiels :
// validation des champs
// affichage d'une boîte de dialogue (AlertDialog) à la soumission pour la confirmation ou l'annulation de l'enregistrement.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent)
      ),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormPage();
}

class _FormPage extends State<FormPage>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key : _formKey,
        child: Column(
        children: [
          TextFormField(
          decoration: InputDecoration(
          labelText: 'Nom complet',
              hintText: 'Entrez votre nom complet'
          )
          ),
          SizedBox(height: 24),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Entrez votre adresse e-mail'
              ),
            validator: (value) {
                if(value==null || value.isEmpty==true) {
                  return 'Veuillez saisir votre adresse e-mail';
                }
                if(!value.contains('@')) {
                  return "L\'adresse e-mail doit necessairement contenir un @";
                }
                return null;
            },
          ),
          SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Mot de passe',
                hintText: 'Entrez votre mot de passe'
            ),
            obscureText: true,
            validator: (value) {
              if(value!.length<6) {
                return 'Le mot de passe doit contenir au moins 6 caracteres';
              }
              if(value==null || value.isEmpty==true) {
                return 'Veuillez saisir votre mot de passe';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(onPressed: _submitForm, child: Text('S’inscrire'))
        ]),
      )
    );
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _showConfirmationDialog();
    }
  }

  void _showConfirmationDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation de l\'inscription'),
            content: Text('Voulez-vous valider votre inscription ?'),
            actions: [
              TextButton(onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Inscription validée avec succès !'),
                      backgroundColor: Colors.green
                  ));
                  }, 
                  child: Text('Valider')),
              TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text('Annuler'))
            ],
          );
        }
    );
  }
}

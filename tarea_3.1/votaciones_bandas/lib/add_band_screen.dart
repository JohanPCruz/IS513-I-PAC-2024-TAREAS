//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:image_picker/image_picker.dart';
import 'voting_screen.dart';


class AddBandScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController albumController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  //final _picker = ImagePicker();
  //File? _imageFile;


  
  //void bueno antes de agregar imagen
  void _addBand(BuildContext context) {
  FirebaseFirestore.instance.collection('bands').add({
    'name': nameController.text,
    'album': albumController.text,
    'year': yearController.text,
    'votes': 0,
  }).then((value) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => VotingScreen()),
    );
  }).catchError((error) => print("Error al añadir banda: $error"));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Banda de Rock'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre de la Banda'),
            ),
            TextField(
              controller: albumController,
              decoration: InputDecoration(labelText: 'Álbum'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Año de Lanzamiento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addBand(context),
              child: Text('Agregar Banda'),
            ),
          ],
        ),
      ),
    );
  }
}

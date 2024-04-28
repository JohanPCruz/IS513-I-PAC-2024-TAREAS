import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'voting_screen.dart';


class AddBandScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController albumController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final _picker = ImagePicker();
  File? _imageFile;

void _addBand(BuildContext context) async {
  final storage = FirebaseStorage.instance;
  final name = nameController.text;
  final album = albumController.text;
  final year = yearController.text;

  if (_imageFile != null) {
    final imageRef = storage.ref().child('band_images/$name.png');
    await imageRef.putFile(_imageFile!);
    final imageUrl = await imageRef.getDownloadURL();

    FirebaseFirestore.instance.collection('bands').add({
      'name': name,
      'album': album,
      'year': year,
      'votes': 0,
      'imageUrl': imageUrl,
    }).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VotingScreen()),
      );
    }).catchError((error) => print("Error al añadir banda: $error"));
  } else {
    print('No se ha seleccionado ninguna imagen.');
  }
}


Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    }
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
            SizedBox(height: 20),
            ElevatedButton(
            onPressed: _getImageFromGallery,
            child: Text('Seleccionar Imagen desde Galería'),
    ),
          ],
        ),
      ),
    );
  }
}

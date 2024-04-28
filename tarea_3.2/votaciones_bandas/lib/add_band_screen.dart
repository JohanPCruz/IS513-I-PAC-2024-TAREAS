import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'voting_screen.dart';
import 'package:votaciones_bandas/optimization/input_data.dart';


class AddBandScreen extends StatefulWidget {
  @override
  _AddBandScreenState createState() => _AddBandScreenState();
}

class _AddBandScreenState extends State{
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
    });
  }
}


Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Banda de Rock'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Visibility(
                  visible: _imageFile != null,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, 
                        width: 1.0, 
                      ),
                    ),
                    child: _imageFile != null
                        ? Image.file(
                            _imageFile!,
                            fit: BoxFit.cover, 
                          )
                        : SizedBox(), 
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomInputData(
                controller: nameController,
                labelText: 'Nombre de la Banda',
                prefixIcon: CupertinoIcons.guitars,
                maxLength: 50,
                keyboardType: TextInputType.text,
              ),
              CustomInputData(
                controller: albumController,
                labelText: 'Album',
                prefixIcon: CupertinoIcons.music_albums,
                maxLength: 50,
                keyboardType: TextInputType.text,
              ),
              CustomInputData(
                controller: yearController,
                labelText: 'Año de Lanzamiento',
                prefixIcon: CupertinoIcons.calendar,
                maxLength: 4,
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _getImageFromGallery,
                  child: Text('Seleccionar Imagen desde Galería'),
                ),
              ),
              SizedBox(height: 70),
              Center(
                child: ElevatedButton(
                  onPressed: () => _addBand(context),
                  child: Text('Agregar Banda'),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


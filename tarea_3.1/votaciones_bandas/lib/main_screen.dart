import 'package:flutter/material.dart';
import 'add_band_screen.dart';
import 'voting_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votaciones de Bandas de Rock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/rock.png', // Ruta de la imagen dentro de los recursos de tu proyecto
              width: 300, // Ancho deseado de la imagen
              height: 300, // Alto deseado de la imagen
            ),
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBandScreen()),
                );
              },
              child: Text('Agregar banda de Rock'),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VotingScreen()),
                );
              },
              child: Text('Votaciones'),
            ),
          ],
        ),
      ),
    );
  }
}

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
        toolbarHeight: 150,
        title: Center(
          child: Text(
            'Votaciones de Bandas de Rock', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26),
            )
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/rock.jpeg', 
                      width: 300, 
                      height: 300, 
                    ),
                  ),
                  SizedBox(height: 70),
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
          ],
        ),
      ),
    );
  }
}

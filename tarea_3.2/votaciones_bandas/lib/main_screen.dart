import 'package:flutter/material.dart';
import 'add_band_screen.dart';
import 'voting_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Center(
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
            const SizedBox(height: 10),
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
                  const SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddBandScreen()),
                      );
                    },
                    child: const Text('Agregar banda de Rock'),
                  ),
                  const SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VotingScreen()),
                      );
                    },
                    child: const Text('Votaciones'),
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

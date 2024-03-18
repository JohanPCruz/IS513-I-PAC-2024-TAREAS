import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Bienvenido, $email'),
      ),
    );
  }
}

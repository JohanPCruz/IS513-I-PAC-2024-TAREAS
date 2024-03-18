import 'package:flutter/material.dart';
import 'package:tarea_3/optimization/input_email.dart';
import 'package:tarea_3/optimization/input_pass.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Inicio de Sesión',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80.0),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20.0),
                  CustomInputEmail(
                    controller: emailController,
                  ),
                  const SizedBox(height: 20.0),
                  CustomInputPass(
                    controller: passwordController,
                    labelText: 'Contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Validacion de credenciales
                      if (emailController.text == 'jpcruzl@unah.hn' &&
                          passwordController.text == '20202001663') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(email: emailController.text)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Credenciales incorrectas'),
                        ));
                      }
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text('Registrarse'),
                  ),
                  const SizedBox(height: 160.0),
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Hecho por Johan Cruz',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

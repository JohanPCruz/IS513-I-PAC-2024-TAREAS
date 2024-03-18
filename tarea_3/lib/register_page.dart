import 'package:flutter/material.dart';
import 'package:tarea_3/optimization/input_email.dart';
import 'package:tarea_3/optimization/input_pass.dart';
import 'package:tarea_3/optimization/personal_data.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Registro'),
      ),*/
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 78.0),
          child: Text('Registro',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
          ),
        ), 
      ), 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputData(
                controller: nameController,
                labelText: 'Nombre',
                prefixIcon: Icons.person,
                maxLength: 50,
                keyboardType: TextInputType.text,
                ),
              //const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              CustomInputEmail(
                controller: emailController
                ),
              const SizedBox(height: 20.0),
              CustomInputData(
                controller: phoneController,
                labelText: 'Teléfono',
                prefixIcon: Icons.phone,
                maxLength: 12,
                keyboardType: TextInputType.phone,
                ),
              const SizedBox(height: 20.0),
              CustomInputPass(
                controller: passwordController,
                labelText: 'Contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              CustomInputPass(
                controller: confirmPasswordController,
                labelText: 'Confirmar Contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  if (_validateFields(context)) {
                    print('Nombre: ${nameController.text}');
                    print('Correo: ${emailController.text}');
                    print('Teléfono: ${phoneController.text}');
                  }
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateFields(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Por favor complete todos los campos'),
      ));
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Las contraseñas no coinciden'),
      ));
      return false;
    }
    return true;
  }
}

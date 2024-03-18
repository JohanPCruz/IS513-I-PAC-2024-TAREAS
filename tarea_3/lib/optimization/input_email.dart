import 'package:flutter/material.dart';


class CustomInputEmail extends StatefulWidget {
  CustomInputEmail({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  

  @override
  State<CustomInputEmail> createState() => _CustomInputEmailState();
}

class _CustomInputEmailState extends State<CustomInputEmail> {
 
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: 30,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text('Correo'),
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        ),        
      );
  }
}
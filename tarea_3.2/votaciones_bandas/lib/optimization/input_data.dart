import 'package:flutter/material.dart';


class CustomInputData extends StatefulWidget {
  const CustomInputData({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.maxLength = 50,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final int  maxLength;
  final TextInputType keyboardType;
  
  @override
  State<CustomInputData> createState() => _CustomInputDataState();
}

class _CustomInputDataState extends State<CustomInputData> {
 
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.prefixIcon),
        ),        
      );
  }
}

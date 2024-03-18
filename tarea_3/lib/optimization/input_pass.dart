import 'package:flutter/material.dart';


class CustomInputPass extends StatefulWidget {
  CustomInputPass({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String labelText;
  bool obscureText;

  @override
  State<CustomInputPass> createState() => _CustomInputPassState();
}

class _CustomInputPassState extends State<CustomInputPass> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _obscureText ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const Icon(Icons.visibility),
            secondChild: const Icon(Icons.visibility_off),
          ),
        ),        
        border: const OutlineInputBorder(),
      ),
    );
  }
}
// lib/components/option_button.dart
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onPress;

  const OptionButton({required this.btnName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      child: Text(
        btnName,
        style: const TextStyle(
            color: Colors.black54, fontFamily: "Poppins-Regular"),
      ),
    );
  }
}

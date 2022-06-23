import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {required this.title,
      required this.color,
      required this.onPressed,
      required this.width});

  final Color color;
  final String title;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(50.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: 60.0,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}

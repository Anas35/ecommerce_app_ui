import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {

  final String text;
  final void Function()? onPressed;

  const CircularButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 55),
        primary: const Color(0xFFd8a046),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text)
    );
  }
}
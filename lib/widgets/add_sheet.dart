import 'package:flutter/material.dart';

class AddSheet extends StatelessWidget {

  final Widget circularButton;

  const AddSheet({Key? key, required this.circularButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.black38))
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 10),
          const Card(
            color: Color(0xFF7b4b93),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.favorite, color: Colors.white, size: 25),
            ),
          ),
          circularButton
        ],
      ),
    );
  }
}
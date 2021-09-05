import 'package:flutter/material.dart';

class QuantityBox extends StatelessWidget {

  final int quantity;
  final void Function()? onIncrement;
  final void Function()? onDecrement;

  const QuantityBox({Key? key, required this.quantity, this.onIncrement, this.onDecrement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 45,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: onIncrement,
          ),
          Text(quantity.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          GestureDetector(
            child: const Icon(Icons.remove),
            onTap: onDecrement,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.only( right: 8.0),
      child: Container(

        width: 150,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        )

      ),
    )
    );
  }
}

import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final Function()? onTap;
  final String errorMessage;

  const CustomErrorWidget(
      {super.key, required this.errorMessage,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
          child: Text(
        errorMessage,
        style: const TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 255, 17, 0)),
      )),
    );
  }
}

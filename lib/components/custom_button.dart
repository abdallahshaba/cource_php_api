import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text22, required this.onPressed});
  final String text22;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
          padding: const EdgeInsets.symmetric(horizontal: 120 , vertical: 10),
          onPressed: onPressed,
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(text22, style: TextStyle(fontSize: 20),),
          );
  }
}
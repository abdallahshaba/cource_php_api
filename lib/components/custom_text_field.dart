import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.name,
      required this.icon,
      this.onTap,
      required this.myController, this.valid});
  final String hintText;
  final String? Function(String?)? valid;
  final String name;
  final Icon icon;
  final void Function()? onTap;
  final TextEditingController myController;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid ,
      controller: myController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blue)),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 142, 134, 134), fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(name)),
          suffixIcon: InkWell(child: icon, onTap: onTap),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}

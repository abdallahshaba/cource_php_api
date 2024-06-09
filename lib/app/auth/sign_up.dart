import 'package:cource_php_app/components/custom_button.dart';
import 'package:cource_php_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Form(
          key: formstate,
            child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
                height: 300, child: Image.asset("asset/images/signUp.png")),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              myController: username,
                hintText: "Enter Username",
                name: "Username",
                icon: const Icon(Icons.person_2_outlined)),
                 const SizedBox(
              height: 20,
            ),
             CustomTextField(
              myController: email ,
                hintText: "Enter email",
                name: "Email",
                icon: const Icon(Icons.email_outlined)),
            const SizedBox(
              height: 20,
            ),
             CustomTextField(
              myController: password,
                hintText: "Enter password",
                name: "Password",
                icon: const Icon(Icons.password_outlined)),
         
            const SizedBox(
              height: 140,
            ),
            CustomButtonAuth(text22: "Sign Up", onPressed: () {}),
            const SizedBox(height: 10,),
            InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('login');
            },
                  child: const Text("Login" , style: TextStyle(fontSize: 20 , 
                  fontWeight: FontWeight.bold
                  ),),
                ),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ))
      ],
    ));
  }
}

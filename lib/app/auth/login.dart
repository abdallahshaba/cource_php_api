import 'package:cource_php_app/components/custom_button.dart';
import 'package:cource_php_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController email = TextEditingController();
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
                height: 300, child: Image.asset("asset/images/login.png")),
            const SizedBox(
              height: 30,
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
              height: 200,
            ),
            CustomButtonAuth(text22: "Login", onPressed: () {
              Navigator.of(context).pushNamed('home');
            }),
            const SizedBox(height: 10,),
            InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('signUp');
            },
                  child: const Text("Sign Up" , style: TextStyle(fontSize: 20 , 
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

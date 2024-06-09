import 'package:cource_php_app/components/crud.dart';
import 'package:cource_php_app/components/custom_button.dart';
import 'package:cource_php_app/components/custom_text_field.dart';
import 'package:cource_php_app/components/valid.dart';
import 'package:cource_php_app/constant/link_api.dart';
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

  bool isLoding = false;
  Crud _crud = Crud();

  login() async {
    if (formstate.currentState!.validate()) {
      isLoding = true;
      setState(() {
        
      });
      var response3 = await _crud.postRequest(linklogin, {
        "email": email.text,
        "password": password.text,
      });
      if (response3['status'] == 'Success') {
        isLoding = false ;
        setState(() {
          
        });
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      }
      else {
        isLoding = false;
        setState(() {
          
        });
        print("email or password is wrong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoding ==true ? const Center(child: CircularProgressIndicator()) : Container(
          child: ListView(
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
                        height: 300,
                        child: Image.asset("asset/images/login.png")),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      valid: (value) {
                        return validInput(value!, 5, 40);
                      },
                        myController: email,
                        hintText: "Enter email",
                        name: "Email",
                        icon: const Icon(Icons.email_outlined)),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      valid: (value) {
                        return validInput(value!, 5, 40);
                      },
                        myController: password,
                        hintText: "Enter password",
                        name: "Password",
                        icon: const Icon(Icons.password_outlined)),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomButtonAuth(
                        text22: "Login",
                        onPressed: () async {
          
                          await login();
                           
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('signUp');
                      },
                      child: const Text(
                        "Sign Up",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ],
                ),
        ));
  }
}

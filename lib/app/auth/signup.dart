import 'package:cource_php_app/components/crud.dart';
import 'package:cource_php_app/components/custom_button.dart';
import 'package:cource_php_app/components/custom_text_field.dart';
import 'package:cource_php_app/components/valid.dart';
import 'package:cource_php_app/constant/link_api.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formstate = GlobalKey();

  bool isLoding = false;

  Crud _crud = Crud();

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    if (formstate.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var respons2 = await _crud.postRequest(linkSignUp, {
        "username": username.text,
        "email": email.text,
        "password": password.text
      });

      isLoding = false;
      setState(() {});

      if (respons2['status'] == 'Success') {
        Navigator.of(context).pushNamed('login');
      } else {
        print("signUp fail");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoding == true
            ? const Center(child: CircularProgressIndicator())
            : Container(
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
                                child: Image.asset("asset/images/signUp.png")),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextField(
                                valid: (value) {
                                  return validInput(value!, 4, 10);
                                },
                                myController: username,
                                hintText: "Enter Username",
                                name: "Username",
                                icon: const Icon(Icons.person_2_outlined)),
                            const SizedBox(
                              height: 20,
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
                                  return validInput(value!, 3, 10);
                                },
                                myController: password,
                                hintText: "Enter password",
                                name: "Password",
                                icon: const Icon(Icons.password_outlined)),
                            const SizedBox(
                              height: 70,
                            ),
                            CustomButtonAuth(
                                text22: "Sign Up",
                                onPressed: () async {
                                  await signUp();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('login');
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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

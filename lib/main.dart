import 'package:cource_php_app/app/auth/login.dart';
import 'package:cource_php_app/app/auth/signup.dart';
import 'package:cource_php_app/app/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



late SharedPreferences sharedPreference;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreference = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Cource PHP Rest API',
      initialRoute: sharedPreference.getString("id_sharedPreferences")==null? "login" : "home",
      routes: {
        "home" : (context) => const HomeScreen(),
        "login" : (context) => const LoginScreen(),
        "signUp" :(context) => const SignUpScreen()
      },
    );
  }
}

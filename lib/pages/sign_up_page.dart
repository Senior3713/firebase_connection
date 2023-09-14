import 'package:firebase_connection_two/pages/sign_in_page.dart';
import 'package:firebase_connection_two/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    if(email.isEmpty || password.isEmpty) {
      return;
    }

    final success = await AuthService.signUp(email, password);
    if(success && context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Sign Up", style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 20,),
              TextField(controller: emailController, decoration: const InputDecoration(hintText: "Email"),),
              const SizedBox(height: 20,),
              TextField(controller: passwordController, decoration: const InputDecoration(hintText: "Password"),),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: signUp, child: const Text("Sign Up")),
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignInPage()));
              }, child: const Text("Already have an account? SignIn")),
            ],
          ),
        ),
      ),
    );
  }
}

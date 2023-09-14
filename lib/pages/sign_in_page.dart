import 'package:firebase_connection_two/pages/home_page.dart';
import 'package:firebase_connection_two/pages/sign_up_page.dart';
import 'package:firebase_connection_two/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    if(email.isEmpty || password.isEmpty) {
      return;
    }

    final user = await AuthService.signIn(email, password);
    debugPrint("USER: $user");
    if(user != null && context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Sign In", style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 20,),
              TextField(controller: emailController, decoration: const InputDecoration(hintText: "Email"),),
              const SizedBox(height: 20,),
              TextField(controller: passwordController, decoration: const InputDecoration(hintText: "Password"),),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: signIn, child: const Text("Sign In")),
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUpPage()));
              }, child: const Text("Don't have an account? SignUp")),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/Layouts.dart';

import 'home_Screen.dart';
import 'register_Screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _Pass = TextEditingController();
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'please enter a valid ema  il';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _Pass,
                  obscureText: isvisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          isvisible = !isvisible;
                          setState(() {});
                        },
                        icon: isvisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          print(_email.text);
                          print(_Pass.text);
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email.text, password: _Pass.text)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Success")));
                            print(value.user?.uid);
                            print(value.user?.email);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Layouts()));
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Failed")));
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue),
                      child: const Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 25))),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: const Text("Register"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

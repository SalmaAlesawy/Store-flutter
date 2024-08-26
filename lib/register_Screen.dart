import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/Layouts.dart';

import 'home_Screen.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final formkey = GlobalKey<FormState>();
TextEditingController _email = TextEditingController();
TextEditingController _Pass = TextEditingController();
bool isvisible = false;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Register",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Container(


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
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        } else if (value.length < 6) {
                          return 'password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: MaterialButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              print(_email.text);
                              print(_Pass.text);
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: _email.text,
                                  password: _Pass.text)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Success")));
                                print(value.user?.uid);
                                print(value.user?.email);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Layouts()));
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text("Failed $error")));
                              });
                            }
                          },
                          child: const Text("Register",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

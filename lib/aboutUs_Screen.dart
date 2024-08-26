import 'package:flutter/material.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("The develober name: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("Salma Mahmoud Hamed Elesawy",style: TextStyle(color: Colors.blue),),
              Text("Faculity of: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("computer and information science",style: TextStyle(color: Colors.blue),),
              Text("Grade Four",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),



            ],
          ),
        ),
      ),
    );
  }
}

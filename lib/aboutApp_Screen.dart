import 'package:flutter/material.dart';

class AboutappScreen extends StatelessWidget {
   const AboutappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/image-vector/product-release-icon-vector-sign-260nw-1902949900.jpg"),
            ),
            SizedBox(
              width: 10,
            ),
            Text("About App"),
          ],
        ),
      ),
      body: Column(children: [
        
        Center(child: Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
        Text("The content of our app is: ",style: TextStyle(fontSize: 20),),
        Text("First page: The home..all our products"),
        Text("Second page: the categories..search by category"),
        Text("Third page: About us...infomation about me "),
        Text("Fourth page: The Profile.. It's yours"),
        Text("Finnally: About App.. It's the content.")
      ],),

      
      
    );
  }
}

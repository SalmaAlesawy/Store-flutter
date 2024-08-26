import 'package:flutter/material.dart';
import 'package:untitled8/categories/beauty.dart';
import 'package:untitled8/categories/fragrances.dart';
import 'package:untitled8/categories/furniture.dart';

import 'categories/groceries.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            Text("Categories"),
          ],
        ),
      ),
      body:

      Column(
        children: [

          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>beauty())
           );
            }, child: const Text("Beauty")),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>fragrances())
            );
          }, child: const Text("Fragrances")), TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>furniture())
            );
          }, child: const Text("furniture")),
        ],

      ),
    );
  }
}

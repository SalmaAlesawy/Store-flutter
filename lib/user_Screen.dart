import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Layouts.dart';




class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  File? _image;
  Future<void>_getimageFromGallary()async{
    final picker=ImagePicker();
    final PickedFile =await picker.pickImage(source: ImageSource.gallery);
    if(PickedFile!=null){
      setState(() {
        _image=File(PickedFile.path);
      });
    }
  }
   final CollectionReference _userCollection=FirebaseFirestore.instance.collection('user');
   TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController aboutcontroller=TextEditingController();
  Future<void>_saveUserData()async{

    try{
      await _userCollection.add({'name':namecontroller.text,'email':emailcontroller.text,'about':aboutcontroller.text});

      namecontroller.clear();
    emailcontroller.clear();
    aboutcontroller.clear();
    }catch(e){
      print('Error saving user data:$e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
GestureDetector(
  onTap: _getimageFromGallary,child: Center(
  child: CircleAvatar(
    radius: 50,backgroundImage: _image!=null?FileImage(_image!):null,
    child: _image==null?const Icon(Icons.add_a_photo,size: 40,):null,
  ),
),
),
              const SizedBox(height: 16,),
              TextField(
                controller: namecontroller,
               keyboardType: TextInputType.name,
               decoration: InputDecoration(
                labelText: 'Your Name', border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                 ),
              ),

const SizedBox(height: 30,),
               TextField(
                 controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Your Number', border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30,),
              TextField(
                controller: aboutcontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Your Number', border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16,),
              Center(child: ElevatedButton(onPressed: (){_saveUserData();
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const Layouts()));

              }, child: const Text("save")))

          ],
        ),


      ),


    );
  }
}

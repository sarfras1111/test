import 'dart:io';

import 'package:figma/function.dart';
import 'package:figma/main.dart';
import 'package:figma/model.dart';
import 'package:figma/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  File? imagePath;
  TextEditingController nameController=TextEditingController();
  TextEditingController placeController=TextEditingController();
  TextEditingController numberController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar(backgroundColor: const Color.fromARGB(255, 54, 53, 53),
    title: Text('Add student',
    style: TextStyle(color: Colors.teal),),
    centerTitle: true,
    ),
    body: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 233, 231, 231),
             backgroundImage: imagePath!=null?FileImage(File(imagePath!.path)):AssetImage(''),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getImage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Add photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 80),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: placeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Place',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Phone',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: () async{

                final data= studentmodel(Name: nameController.text, Place: placeController.text, phone: numberController.text, photopath: imagePath!.path);
              await  addStudent(data);

                Navigator.pop(context); 
                
           
              
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
     ),
);


}
void getImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img == null) return;
    setState(() {
      imagePath = File(img.path);
    });
  }

}
    
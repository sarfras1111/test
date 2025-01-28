import 'dart:io';

import 'package:figma/function.dart';
import 'package:figma/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class editScreen extends StatefulWidget {
  const editScreen({super.key,
  required this.index,required this.name,required this.place,required this.phone,required this.photopath});
  final String  name;
  final String place;
  final String phone;
  final String photopath;
  final int index;

  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  File? imagePath;
  @override
  Widget build(BuildContext context) {TextEditingController editNameController =
TextEditingController (text: widget.name);
TextEditingController editPlaceController =
TextEditingController (text: widget.place);
TextEditingController editNumberController =
TextEditingController(text: widget.phone);
    return Scaffold (appBar: AppBar(backgroundColor: const Color.fromARGB(255, 54, 53, 53),
    title: Text('Edit student',
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
              backgroundImage: imagePath != null 
              ?FileImage( File(imagePath!.path))
              :FileImage(File(widget.photopath)),
              backgroundColor: const Color.fromARGB(255, 233, 231, 231),
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 70,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getImage   ();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Edit photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 80),
            TextField(
              controller: editNameController,
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
              controller: editPlaceController,
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
              controller: editNumberController,
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
           
           ElevatedButton(onPressed: () async{

            final data=studentmodel(Name: editNameController.text, Place: editPlaceController.text, phone: editNumberController.text, photopath: imagePath!.path);
            await editstudent(widget.index, data);
            Navigator.pop(context);
             
           }, child: Text('Save'))
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
});(() {
imagePath =File(img.path);
});
}
}
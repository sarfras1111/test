import 'dart:io';

import 'package:figma/function.dart';
import 'package:figma/model.dart';
import 'package:figma/page2.dart';
import 'package:figma/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();

if(!Hive.isAdapterRegistered(studentmodelAdapter().typeId)){
  Hive.registerAdapter(studentmodelAdapter());
}
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
State<MyApp> createState() =>
_MyAppState();
}
class _MyAppState extends
State<MyApp> {
File?imagepath;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),

    );

  }
}
class Homescreen extends StatelessWidget{
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Homescreen',style: TextStyle(color: Colors.teal),),
        
        
      ),
      
      body:ValueListenableBuilder(valueListenable:valueNotifier,
      builder: (context, studentlist, child) {
        return ListView.builder(
          itemCount:studentlist.length,
          itemBuilder: (context, index) {
            final student = studentlist[index];

            return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.black, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              
        
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                
                child: Icon(Icons.person, color: Colors.black)
                ,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        
                        context: context, builder:(context) => Builder(
                        builder: (context) {
                          
                          
                          return AlertDialog(
                            backgroundColor: Colors.grey[800],
                             icon:Icon( CupertinoIcons.person_alt_circle_fill,size: 80,),
                            content: SizedBox(
                              height: 250,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text('Name :',style: TextStyle(color: Colors.teal),),
                                     Text(student.Name,style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                               SizedBox(height:20 ,),
                                Row(
                                  children: [
                                    Text('Place :',style: TextStyle(color:Colors.teal),),
                                    Text(student.Place,style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                
                                Row(
                                  children: [
                                    Text('Phone :',style:TextStyle(color: Colors.teal),),
                                    Text(student.phone,style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(height: 20,),
                                
                              ],),
                            ),
                            
                          );
                        }
                      ),)
                      
                      ;
                    },
                    child: Text(
                      student.Name,
                      style: TextStyle(
                        color:  Colors.teal,
                         
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => editScreen(index: index, name:student.Name, place:student.Place, phone:student.phone, photopath:student.photopath)),
                        
                          );
                        
                    },
                  child:  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Icon(Icons.edit, color: Colors.teal),
                  ),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    student.Place,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ), 
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        
                        context: context, builder:(context) => Builder(
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Do you want to delete this \n               student',style: TextStyle(color: Colors.teal),),
                            backgroundColor: Colors.grey[800],
                            
                          content: SizedBox(height: 100,
                          
                                ),
                              
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      
                                    ),
                                         TextButton(
        
                                      onPressed: () {
                                        
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color:Colors.red),
                                    ),
                                                            ),
                                
                             
                                  ],
                                ),
                                
                                
                                
                                  
                                 
                               
                          
                          
                          
                          
                              ]
                          );
                        }
                        )
                         );
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              ),
              
              
            ),
          ),
             );
          },
        );
      },
        
      ),
     floatingActionButton: Padding(
       padding: const EdgeInsets.all(8.0),
       child: FloatingActionButton(
          onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),));
          },
          backgroundColor:Colors.teal,
          child: Icon(Icons.add),
       ),
     ),
);
}
}



  
    
  


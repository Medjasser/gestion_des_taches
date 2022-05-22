

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_des_taches/projet/theme.dart';
import 'package:gestion_des_taches/projet/widgets/input_field.dart';
import 'package:get/get.dart';

class  AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage>{
  DateTime _selectedDate = DateTime.now();
@override
Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.only(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Task",
                style:HeadingStyle,
           ),
              MyInputField(title: "Title", hint: "Enter your title"),
              MyInputField(title: "note", hint: "Enter your note"),

          ],
        ),
      ),
      )
    );
}
_appBar(){
  return AppBar(

    leading: GestureDetector(
      onTap: (){
        Get.back();

      },
      child: Icon(Icons.arrow_back_ios,
        size: 20,

      ),
    ),
    actions: [
      CircleAvatar(
        backgroundImage: AssetImage(
            "images/avatar.jpg"
        ),
      ),
    ],
  );
}
}
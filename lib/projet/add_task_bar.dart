import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class  AddTaskPage extends StatelessWidget {
const AddTaskPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(

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
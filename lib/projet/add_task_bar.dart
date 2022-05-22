

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_des_taches/projet/theme.dart';
import 'package:gestion_des_taches/projet/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class  AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage>{
  DateTime _selectedDate = DateTime.now();
  String _endTime="10:00 PM";
  String _startTime= DateFormat("hh:mm a").format(DateTime.now()).toString();

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
              MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon: Icon(Icons.calendar_today_outlined),
                onPressed: () {
                  print("hi");
                  _getDateFromUser();

                  },
              ),
              ),
              Row (
                children: [
                  Expanded(
                    child: MyInputField(
                     title: "Start Date",
                      hint: _startTime ,
                      widget: IconButton(
                        onPressed: (){
                          _getTimeFromUser(isStarTime: true);

                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color:Colors.grey
                        )
                      )
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: MyInputField(
                        title: "End Date",
                        hint: _endTime ,
                        widget: IconButton(
                            onPressed: (){
                              _getTimeFromUser(isStarTime: false);

                            },
                            icon: Icon(
                                Icons.access_time_rounded,
                                color:Colors.grey
                            )
                        )
                    ),
                  ),
                ],
              )

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

_getDateFromUser () async {
  DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025)
  );
  if( _pickerDate!= null){
    setState(() {
      _selectedDate = _pickerDate;
      print(_selectedDate);
    });

  }else {
    print("It's null ");
  }

}

_getTimeFromUser({required bool isStarTime}) async{
  var pickedTime = await _showTimePicker();
  String _formatedTime = pickedTime.format(context);
  if(pickedTime==null){
    print("Time cannelc");

  }else if(isStarTime==true){

    setState((){
      _startTime=_formatedTime;
    });


  }else if(isStarTime==false){
    setState(() {
      _endTime=_formatedTime;
    });


  }

}
_showTimePicker(){
  return
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(

            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
  )
    );
}

}
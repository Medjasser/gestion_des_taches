import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_des_taches/projet/theme.dart';
import 'package:gestion_des_taches/projet/widgets/button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../services/notification_services.dart';
import '../services/theme_services.dart';
import 'add_task_bar.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now() ;
  var notifyHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),

        ],
      ),
    );
    }
    _addDateBar(){
    return Container(
      margin: const EdgeInsets.only(top:20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        dateTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey
        ),
        onDateChange: (date){
          _selectedDate=date;
        },

      ),
    );
    }
    _addTaskBar(){
    return Row(

      children : [
        Container(
          margin: const EdgeInsets.symmetric(horizontal:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text("Today",
                style: HeadingStyle,
              )
            ],
          ),
        ),
        MyButton(label: "       ADD TASK ", onTap: ()=> Get.to(AddTaskPage()))
      ],
    );
    }

    _appBar(){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title:"theme changed",
            body: Get.isDarkMode?"Activated light Theme":"Activated dark Theme"
          );

          notifyHelper.scheduledNotification();

        },
        child: Icon(Icons.wb_sunny_outlined,
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

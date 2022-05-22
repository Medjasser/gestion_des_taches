import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../services/notification_services.dart';
import '../services/theme_services.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Row(
            children : [
              Column(
                children: [
                  Text( DateFormat.yMMMMd().format(DateTime.now())),
                ],
              )
            ],
          )
        ],
      ),
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

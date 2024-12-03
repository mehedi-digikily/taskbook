import 'package:flutter/material.dart';

import '../../component/appBottomNav.dart';
import '../../component/cancel_task.dart';
import '../../component/complated_task.dart';
import '../../component/new_task_.dart';
import '../../component/progress_task.dart';
import '../../component/taskAppBar.dart';

class HomeTaskScreen extends StatefulWidget {
  const HomeTaskScreen({super.key});

  @override
  State<HomeTaskScreen> createState() => _HomeTaskScreenState();
}

class _HomeTaskScreenState extends State<HomeTaskScreen> {

  int TabIndex = 0;

  onItemTapped(index){
    setState(() {
      TabIndex = index;
    });
  }

  final widgetOptions =[
    const NewTaskList(),
    const ProgressTask(),
    const CompletedTask(),
    const CancelTask(),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: taskAppBar(),
        body: widgetOptions[TabIndex] ,
        bottomNavigationBar: appBottomNav(
            TabIndex, onItemTapped
        ),
      ),
    );
  }
}

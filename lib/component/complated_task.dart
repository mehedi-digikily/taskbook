
import 'package:flutter/material.dart';
import 'package:note/component/task_list.dart';

import '../api/apiClient.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {

  List TaskListItem = [];
  bool Loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  Future<void> callData() async {
    var data = await TaskListRequest('Completed');
    setState(() {
      Loading = false;
      TaskListItem = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Loading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : RefreshIndicator(
      onRefresh: ()async{
        await callData();
      },
      child: taskList(TaskListItem),
    );
  }
}

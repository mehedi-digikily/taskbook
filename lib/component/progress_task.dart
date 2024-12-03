import 'package:flutter/material.dart';
import 'package:note/component/task_list.dart';

import '../api/apiClient.dart';

class ProgressTask extends StatefulWidget {
  const ProgressTask({super.key});

  @override
  State<ProgressTask> createState() => _ProgressTaskState();
}

class _ProgressTaskState extends State<ProgressTask> {
  List TaskListItem = [];
  bool Loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  Future<void> callData() async {
    var data = await TaskListRequest('Progress');
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

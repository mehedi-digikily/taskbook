import 'package:flutter/material.dart';
import 'package:note/component/task_list.dart';

import '../api/apiClient.dart';

class CancelTask extends StatefulWidget {
  const CancelTask({super.key});

  @override
  State<CancelTask> createState() => _CancelTaskState();
}

class _CancelTaskState extends State<CancelTask> {
  List TaskListItem = [];
  bool Loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  Future<void> callData() async {
    var data = await TaskListRequest('Cancel');
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

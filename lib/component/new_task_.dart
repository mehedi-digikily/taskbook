import 'package:flutter/material.dart';
import 'package:note/component/task_list.dart';

import '../api/apiClient.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({super.key});

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  List TaskListItem = [];
  bool Loading = true;

  @override
  void initState() {
    super.initState();
    callData();
  }

  Future<void> callData() async {
    var data = await TaskListRequest('New');
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

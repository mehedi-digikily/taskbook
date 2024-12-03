import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styel/style.dart';

ListView taskList(TaskItem) {
  return ListView.builder(
    itemCount: TaskItem.length,
    itemBuilder: (context, index) {
      return Card(
        child: ItemSizeBox(
          Column(
            children: [
              Text(
                TaskItem[index]['title'],
                style: Head6Text(
                  colorDarkBlue,
                ),
              ),
              Text(
                TaskItem[index]['description'],
                style: Head6Text(
                  colorLight,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

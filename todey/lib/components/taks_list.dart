import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/components/task_tile.dart';
import 'package:todey/models/task_store.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(builder: (context, store, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: store.tasks[index].name,
              isChecked: store.tasks[index].isDone,
              onChanged: (value) {
                store.updateTask(store.tasks[index]);
              },
              onLongPress: () => store.deleteTask(store.tasks[index]),
            );
          },
          itemCount: store.tasks.length);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/models/task_store.dart';

class AddTaskScreen extends StatelessWidget {
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              style: TextStyle(fontSize: 32, color: Colors.lightBlueAccent),
              textAlign: TextAlign.center,
            ),
            TextField(
              autofocus: true,
              onChanged: (value) {
                taskName = value;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskStore>(context, listen: false)
                    .addTask(taskName);
                Navigator.pop(context);
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

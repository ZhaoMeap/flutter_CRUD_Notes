// lib/page/schedule_page.dart

import 'package:flutter/material.dart';
import 'package:crud_demo/model/employee.dart';

import 'editable_schedule_page.dart'; // 請替換成您的員工模型路徑

class SchedulePage extends StatefulWidget {
  final List<Employee> employees;

  SchedulePage({required this.employees});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排班'),
      ),
      body: ListView.builder(
        itemCount: widget.employees.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.employees[index].name),
            subtitle: Text('請安排${widget.employees[index].name}的班表'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditableSchedulePage(employee: widget.employees[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

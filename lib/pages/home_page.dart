// lib/page/home_page.dart

import 'package:flutter/material.dart';
import 'package:crud_demo/model/employee.dart'; // 請替換成您的員工模型路徑
import 'package:crud_demo/pages/schedule_page.dart'; // 請替換成您的排班頁面路徑
import 'package:crud_demo/pages/schedule_detail_page.dart'; // 請替換成您的排班詳細頁面路徑

class HomePage extends StatelessWidget {
  final List<Employee> employees;

  HomePage({required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(employees[index].name),
            subtitle: Text('職稱: ${employees[index].title}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScheduleDetailPage(employee: employees[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SchedulePage(employees: employees),
            ),
          );
        },
        child: Icon(Icons.schedule),
      ),
    );
  }
}

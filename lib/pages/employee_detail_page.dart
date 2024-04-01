// lib/page/employee_detail_page.dart

import 'package:flutter/material.dart';
import 'package:crud_demo/model/employee.dart'; // 請替換成您的員工模型路徑

class EmployeeDetailPage extends StatelessWidget {
  final Employee employee;

  EmployeeDetailPage({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('員工詳細信息'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('姓名: ${employee.name}'),
            Text('職稱: ${employee.title}'),
            Text('聯絡方式: ${employee.contact}'),
            Text('地址: ${employee.address}'),
            Text('加入日期: ${employee.joinDate}'),
            Text('服務年限: ${employee.serviceYears}'),
          ],
        ),
      ),
    );
  }
}

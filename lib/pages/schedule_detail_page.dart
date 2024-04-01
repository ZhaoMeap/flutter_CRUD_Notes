// lib/page/schedule_detail_page.dart

import 'package:flutter/material.dart';
import 'package:crud_demo/model/employee.dart'; // 請替換成您的員工模型路徑

class ScheduleDetailPage extends StatelessWidget {
  final Employee employee;

  ScheduleDetailPage({required this.employee});

  // 模擬的班表數據
  final Map<String, Map<String, String>> scheduleData = {
    '2024/04/01': {'早班': '張三', '中班': '李四', '晚班': '王五'},
    '2024/04/02': {'早班': '王五', '中班': '趙六', '晚班': '張三'},
    '2024/04/03': {'早班': '李四', '中班': '王五', '晚班': '趙六'},
    '2024/04/04': {'早班': '趙六', '中班': '張三', '晚班': '李四'},
    '2024/04/05': {'早班': '李四', '中班': '王五', '晚班': '張三'},
    '2024/04/06': {'早班': '張三', '中班': '趙六', '晚班': '李四'},
    '2024/04/07': {'早班': '王五', '中班': '李四', '晚班': '張三'},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${employee.name}的班表'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // 支持橫向滾動
        child: DataTable(
          columnSpacing: 20, // 列之間的間距
          headingRowHeight: 60, // 標題行高度
          dataRowHeight: 60, // 數據行高度
          columns: _buildColumns(), // 構建列標題
          rows: _buildRows(), // 構建行數據
        ),
      ),
    );
  }

  // 構建列標題
  List<DataColumn> _buildColumns() {
    return [
      DataColumn(label: Text('日期')),
      DataColumn(label: Text('早班（9:00 - 15:00）')),
      DataColumn(label: Text('中班（15:00 - 21:00）')),
      DataColumn(label: Text('晚班（21:00 - 3:00）')),
    ];
  }

  // 構建行數據
  List<DataRow> _buildRows() {
    List<DataRow> rows = [];

    // 根據模擬的班表數據生成行數據
    scheduleData.forEach((date, shifts) {
      if (shifts.containsValue(employee.name)) {
        rows.add(DataRow(cells: [
          DataCell(Text(date)),
          DataCell(Text(shifts['早班'] == employee.name ? '是' : '')),
          DataCell(Text(shifts['中班'] == employee.name ? '是' : '')),
          DataCell(Text(shifts['晚班'] == employee.name ? '是' : '')),
        ]));
      }
    });

    return rows;
  }
}

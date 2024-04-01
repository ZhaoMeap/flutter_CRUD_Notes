// lib/page/editable_schedule_page.dart

import 'package:flutter/material.dart';
import 'package:crud_demo/model/employee.dart'; // 請替換成您的員工模型路徑
import 'package:crud_demo/component/editable_shift_cell.dart'; // 導入 EditableShiftCell

class EditableSchedulePage extends StatefulWidget {
  final Employee employee;

  EditableSchedulePage({required this.employee});

  @override
  _EditableSchedulePageState createState() => _EditableSchedulePageState();
}

class _EditableSchedulePageState extends State<EditableSchedulePage> {
  // 先聲明並初始化 employeeNames 變數
  late List<String> employeeNames;

  @override
  void initState() {
    super.initState();
    // 在 initState 中初始化 employeeNames 變數
    employeeNames = getEmployeeNames();
  }
  // 模擬的班表數據
  Map<String, Map<String, String?>> scheduleData = {
    '2024/04/01': {'早班': '張三', '中班': '李四', '晚班': '王五'},
    '2024/04/02': {'早班': '王五', '中班': '趙六', '晚班': '張三'},
    '2024/04/03': {'早班': '李四', '中班': '王五', '晚班': '趙六'},
    '2024/04/04': {'早班': '趙六', '中班': '張三', '晚班': '李四'},
    '2024/04/05': {'早班': '李四', '中班': '王五', '晚班': '張三'},
    '2024/04/06': {'早班': '張三', '中班': '趙六', '晚班': '李四'},
    '2024/04/07': {'早班': '王五', '中班': '李四', '晚班': '張三'},
  };

  // 提取員工名稱列表的方法
  List<String> getEmployeeNames() {
    Set<String> names = Set();
    scheduleData.forEach((date, shifts) {
      shifts.forEach((shift, employee) {
        names.add(employee ?? '');
      });
    });
    return names.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('編輯班表 - ${widget.employee.name}'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20,
          headingRowHeight: 60,
          dataRowHeight: 60,
          columns: _buildColumns(),
          rows: _buildRows(),
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
      if (shifts.containsValue(widget.employee.name)) {
        rows.add(DataRow(cells: [
          DataCell(Text(date)),
          DataCell(Container(child: EditableShiftCell(shift: '早班', initialValue: shifts['早班'] ?? '', employeeNames: this.employeeNames))),
          DataCell(Container(child: EditableShiftCell(shift: '中班', initialValue: shifts['中班'] ?? '', employeeNames: this.employeeNames))),
          DataCell(Container(child: EditableShiftCell(shift: '晚班', initialValue: shifts['晚班'] ?? '', employeeNames: this.employeeNames))),
        ]));
      }
    });

    return rows;
  }
}
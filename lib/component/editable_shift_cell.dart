// lib/components/editable_shift_cell.dart

import 'package:flutter/material.dart';

class EditableShiftCell extends StatefulWidget {
  final String shift;
  final String initialValue;
  final List<String> employeeNames; // 員工名稱列表

  EditableShiftCell({required this.shift, required this.initialValue, required this.employeeNames});

  @override
  _EditableShiftCellState createState() => _EditableShiftCellState();
}

class _EditableShiftCellState extends State<EditableShiftCell> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _controller.text,
      items: widget.employeeNames.map((String employee) {
        return DropdownMenuItem<String>(
          value: employee,
          child: Text(employee),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _controller.text = newValue ?? '';
        });
      },
    );
  }
}

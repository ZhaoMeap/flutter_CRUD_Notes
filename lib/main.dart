import 'package:crud_demo/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'model/employee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(employees:[
        Employee(
          name: '張三',
          title: '收銀員',
          contact: '0912-345678',
          address: '台北市中山區',
          joinDate: '2022/01/15',
          serviceYears: '2 年',
        ),
        Employee(
          name: '李四',
          title: '製作員',
          contact: '0987-654321',
          address: '新北市板橋區',
          joinDate: '2022/02/10',
          serviceYears: '2 年',
        ),
        Employee(
          name: '王五',
          title: '店長',
          contact: '0958-123456',
          address: '台中市西屯區',
          joinDate: '2021/12/20',
          serviceYears: '3 年',
        ),
        Employee(
          name: '趙六',
          title: '清潔員',
          contact: '0921-876543',
          address: '高雄市鳳山區',
          joinDate: '2023/03/05',
          serviceYears: '1 年',
        ),
        ],
      )
    );
  }
}

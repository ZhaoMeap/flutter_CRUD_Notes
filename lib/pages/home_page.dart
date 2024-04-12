// lib/page/home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('龍吟後台管理系統'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {},
            child: Text('產品管理'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.only(left: 100, right: 100)),
            ),
          ),
          OutlinedButton(onPressed: () {}, child: Text('員工管理')),
        ],
      )),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '這邊放使用者大頭照',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('個人資料'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('設定'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('登出'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

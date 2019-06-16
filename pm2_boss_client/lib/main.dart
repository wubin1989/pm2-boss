import 'package:flutter/material.dart';
import 'package:pm2_boss_client/entry.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pm2服务监控',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Entry(),
    );
  }
}
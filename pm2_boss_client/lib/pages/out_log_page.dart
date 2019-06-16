import 'package:flutter/material.dart';

class OutLogPage extends StatefulWidget {

  final String file;
  final String processName;

  OutLogPage(this.processName, this.file);

  @override
  _OutLogPageState createState() => _OutLogPageState();

}

class _OutLogPageState extends State<OutLogPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.processName}的Out日志'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        )
      ),
      body: Center(
        child: Text(widget.file),
      ),
    );
  }
  
}
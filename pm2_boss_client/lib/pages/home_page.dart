import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pm2_boss_client/components/process_list_component.dart';
import 'package:pm2_boss_client/entities/process_entity.dart';
import 'package:pm2_boss_client/protocol.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Future<List<ProcessEntity>> fetchProcessList() async {
    final http.Response resp = await http.get('$API_ENTRYPOINT/pm2');
    Utf8Decoder utf8decoder = Utf8Decoder();
    final Iterable it = json.decode(utf8decoder.convert(resp.bodyBytes));
    return it.map((obj) => ProcessEntity.fromJson(obj)).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            FutureBuilder<List<ProcessEntity>>(
              future: fetchProcessList(),
              builder: (BuildContext context, AsyncSnapshot<List<ProcessEntity>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Input a URL to start!');
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                    return Text('');
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text(
                        '${snapshot.error}',
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      return Expanded(child: ProcessListComponent(snapshot.data));
                    }
                }
              },
            )
          ],
      ),
    );
  }

}
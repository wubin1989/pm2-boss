import 'package:flutter/material.dart';
import 'package:pm2_boss_client/entities/tail_entity.dart';
import 'package:pm2_boss_client/protocol.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LogPage extends StatefulWidget {
  final String file;
  final String title;

  LogPage(this.title, this.file);

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  List<String> _lines;
  IO.Socket socket;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _lines = [];
    _initSocketIO();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(afterBuild);
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: GestureDetector(
            onTap: () {
              socket.emit('unwatchFile', widget.file);
              socket.close();
              socket.clearListeners();
              socket.destroy();
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Text(_lines.join('\n')),
        ),
      ),
    );
  }

  _initSocketIO() {
    socket = IO.io(SOCKETIO_ENTRYPOINT, <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'foo': 'bar'},
      'forceNew': true,
    });
    socket.on('connect', (_) {
      print('connect');
      socket.emit('watchFile', widget.file);
    });
    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('log', (data) {
      var lines = TailEntity.fromJson(data).tail;
      lines = lines.where((line) => line != '').toList();
      setState(() {
        _lines.addAll(lines);
      });
    });
  }

  afterBuild(_) {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }
}

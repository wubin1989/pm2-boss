import 'package:flutter/material.dart';
import 'package:kilobyte/kilobyte.dart' as kilobyte;
import 'package:pm2_boss_client/entities/process_entity.dart';
import 'package:pm2_boss_client/pages/out_log_page.dart';

class ProcessListComponent extends StatefulWidget {
  final List<ProcessEntity> processList;

  ProcessListComponent(this.processList);

  @override
  _ProcessListState createState() => _ProcessListState();
}

class _ProcessListState extends State<ProcessListComponent> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.processList.length,
      itemBuilder: _BuildProcessItem,
    );
  }

  Widget _BuildProcessItem(BuildContext context, int i) {
    final ProcessEntity processEntity = widget.processList[i];
    final int createdAt = processEntity.pm2Env.createdAt;
    final String onlineInHours = _printDuration(DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(createdAt)));
    final num memoryUsageInMegabytes =
        kilobyte.Size(bytes: processEntity.monit.memory).inMegabytes;
    return Card(
      child: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            _renderItem('进程名', '${processEntity.name}'),
            _renderItem('进程ID', '${processEntity.pid}'),
            _renderItem('ID', '${processEntity.pmId}'),
            _renderItem('状态', '${processEntity.pm2Env.status}'),
            _renderItem('自动重启', '${processEntity.pm2Env.autorestart}'),
            _renderItem('在线时长', '${onlineInHours}'),
            _renderItem('cpu', '${processEntity.monit.cpu}'),
            _renderItem('内存', '${memoryUsageInMegabytes}M'),
            _renderButton(
                '查看Out日志',
                OutLogPage(
                    processEntity.name, processEntity.pm2Env.pmOutLogPath)),
          ],
        ),
      ),
    );
  }

  _renderButton(String title, Widget page) {
    return Container(
      child: RaisedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => page)),
        child: Text(title),
      ),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  _renderItem(String propKey, String propValue) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(border: Border(
              right: BorderSide(color: Colors.black12,),
            )),
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_right, color: Colors.blueAccent),
                Text(
                  propKey,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          Expanded(child: Text('')),
          Text(
            propValue,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

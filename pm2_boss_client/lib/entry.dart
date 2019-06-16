import 'package:flutter/material.dart';
import 'package:pm2_boss_client/pages/home_page.dart';
import 'package:pm2_boss_client/pages/server_list_page.dart';

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();

}

class _EntryState extends State<Entry> {
  final Color _defaultColor = Colors.grey;
  final Color _activatedColor = Colors.blue;

  int _currentIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          ServerListPage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            _controller.jumpToPage(index);
            setState((){
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 18,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 18,
                color: _activatedColor,
              ),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cloud_circle,
                size: 18,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.cloud_circle,
                size: 18,
                color: _activatedColor,
              ),
              title: Text('服务器'),
            ),
          ]),
    );
  }
}

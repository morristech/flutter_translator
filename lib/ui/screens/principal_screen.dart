import 'package:flutter/material.dart';
import '../../ui/screens/history/history_screen.dart';
import '../../ui/screens/home/home_screen.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _selectedIndex;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    Center(child: Text('Info')),
  ];
  final _bottomNavigationBarItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Inicio'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      title: Text('Historial'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info),
      title: Text('Info'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Traductor flutter"),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

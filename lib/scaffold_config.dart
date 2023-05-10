import 'package:flutter/material.dart';
import 'package:template/home.dart';
import 'package:template/mine.dart';
import 'package:template/search.dart';


class ScaffoldConfig extends StatefulWidget {

  const ScaffoldConfig({super.key});

  @override
  State<StatefulWidget> createState() => _ScaffoldConfigState();
}

class _ScaffoldConfigState extends State<ScaffoldConfig> {

  static const items = [
    HomePage(),
    SearchPage(),
    MinePage(),
  ];

  int _index = 0;

  static const iconSize = 32.0;
  static const bottomAppBarHeight = 50.0;
  static const bottomAppBarBPadding = 30.0;
  static const bottomAppBarLPadding = 20.0;

  void ontap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[_index],
      bottomNavigationBar: BottomAppBar(
        height: bottomAppBarHeight,
        padding: const EdgeInsets.only(
          bottom: bottomAppBarBPadding,
          left: bottomAppBarLPadding
        ),
      
        shape: const CircularNotchedRectangle(),
        
        child: Row(
          children: [
            IconButton(
              onPressed: () => {
                ontap(0)
              },
              icon: const Icon(Icons.home),
              tooltip: 'Home',
              iconSize: iconSize,
            ),
            IconButton(
              onPressed: () => {
                ontap(1)
              },
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              iconSize: iconSize,
            ),
            IconButton(
              onPressed: () => {
                ontap(2)
              },
              icon: const Icon(Icons.person),
              tooltip: 'Mine',
              iconSize: iconSize,
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.camera_alt),
      ),

    );
  }

}

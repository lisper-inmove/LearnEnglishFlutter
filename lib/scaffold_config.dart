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
        child: Row(
          children: [
            IconButton(
              onPressed: () => {
                ontap(0)
              },
              icon: const Icon(Icons.home),
              tooltip: 'Home',
            ),
            IconButton(
              onPressed: () => {
                ontap(1)
              },
              icon: const Icon(Icons.search),
              tooltip: 'Search',
            ),
            IconButton(
              onPressed: () => {
                ontap(2)
              },
              icon: const Icon(Icons.person),
              tooltip: 'Mine',
            ),
          ],
        ),
      ),
    );
  }

}

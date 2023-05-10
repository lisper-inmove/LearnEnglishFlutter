import 'package:flutter/material.dart';
import 'package:template/home.dart';
import 'package:template/mine.dart';
import 'package:template/search.dart';


class ScaffoldConfig {

  Widget getBottomAppBar() {

    const home = HomePage();
    const search = SearchPage();
    const mine = MinePage();

    return BottomAppBar(
      height: 60,
      child: Row(
        children: [
          IconButton(
            onPressed: null, 
            icon: Icon(home.icon),
            tooltip: home.tooltip,
          ),
          IconButton(
            onPressed: null, 
            icon: Icon(search.icon),
            tooltip: search.tooltip,
          ),
          IconButton(
            onPressed: null, 
            icon: Icon(mine.icon),
            tooltip: mine.tooltip,
          ),
        ],
      ),
    );
  }
}

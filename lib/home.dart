import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});

  final icon = Icons.home;
  final tooltip = 'Home';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Text('test');
  }

}

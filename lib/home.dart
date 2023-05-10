import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Test $_count');
  }

  void ontap() {
    setState(() {
      _count++;
    });
  }

}

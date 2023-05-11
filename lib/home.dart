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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("home-page.jpeg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void ontap() {
    setState(() {
      _count++;
    });
  }

}

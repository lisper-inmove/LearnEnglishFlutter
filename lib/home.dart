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
        color: Colors.black,
      ),
      child: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 100,
          child: _createHeader(context)
        ),
        Expanded(
          flex: 1,
          child: _createSplit()
        ),
        Expanded(
          flex: 200,
          child: _createMain(context),
        ),
      ],
    );
  }

  Widget _createSplit() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 20,
            child: _createAvatar(context),
          ),
          Expanded(
            flex: 80,
            child: _createCalendar(context),
          ),
        ],
      ),
    );
  }

  Widget _createAvatar(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 150),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('einstein.png'),
            fit: BoxFit.contain,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _createCalendar(BuildContext context) {
    return Container();
  }

  Widget _createMain(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      ),
    );
  }

  void ontap() {
    setState(() {
      _count++;
    });
  }

}

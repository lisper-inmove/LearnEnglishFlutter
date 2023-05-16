import 'dart:ui';
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
        color: Color(0x00ECF3F9),
        image: DecorationImage(
          image: AssetImage('bg01.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 140,
          child: _createHeader(context)
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
    Size s = MediaQuery.of(context).size;
    double width = 400;
    double left = (s.width - width) / 2;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 180, left: left),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: width / 2,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.3)
                  ),
                  child: Text(
                    'Frosted',
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

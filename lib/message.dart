import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  final bool isSendByMe;

  const Message({
    this.text = "", 
    this.isSendByMe = true,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isSendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: isSendByMe 
          ? _buildSentMessage(context)
          : _buildReceivedMessage(context),
      ),
    );
  }

  List<Widget> _buildSentMessage(BuildContext context) {
    return <Widget>[
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // 设置为end，让消息紧贴右侧
          children: <Widget>[
            Text("Username", style: Theme.of(context).textTheme.titleMedium), 
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.blue[100],
              ),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: const CircleAvatar(child: Text('M')), 
      ),
    ];
  }

  List<Widget> _buildReceivedMessage(BuildContext context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: const CircleAvatar(child: Text('U')), 
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Username", style: Theme.of(context).textTheme.titleMedium), 
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.green[100],
              ),
              child: Text(text),
            ),
          ],
        ),
      ),
    ];
  }

}


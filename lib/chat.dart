import 'dart:math';

import 'package:flutter/material.dart';
import 'package:template/message.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];

  // 输入框
  final TextEditingController _textController = TextEditingController();
  final _focusNode = FocusNode();

  // 屏幕滚动
  final ScrollController _scrollController = ScrollController();
  bool _showScrollButton = false;

  String _msg = "Send a message";
  final _hint = "Send a message";

  @override
  void initState() {
    super.initState();

    // TODO: For test
    for (int i = 0; i < 20; i++) {
      _handleSubmitted("test");
    }

    _focusNode.addListener(_handleFocusChange);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // 焦点变化时,触发的函数
  void _handleFocusChange() {
    if (_focusNode.hasFocus) {

    } else {

    }
  }

  void _scrollListener() {
    print("offset: ${_scrollController.offset};min: ${_scrollController.position.minScrollExtent}");
    if (_scrollController.offset - 50 > _scrollController.position.minScrollExtent &&
      !_scrollController.position.outOfRange) {
      setState(() {
        _showScrollButton = true;
      });
    } else {
      setState(() {
        _showScrollButton = false;
      });
    }
  }

  void _scrollToEnd() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    setState(() {
      _showScrollButton = false;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
     _scrollController.addListener(_scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70, // 修改背景颜色
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 设置为居中
          children: <Widget>[
            _createFriendWidget(),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          if (_showScrollButton)
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: _scrollToEnd,
                      icon: const Icon(Icons.arrow_downward),
                    ),
                  ),
                ),
              ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _createFriendWidget() {
    return const Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 设置为居中
        children: <Widget>[
          // CircleAvatar(child: Text('V')), // 这是用户头像，你可以根据需要修改
          SizedBox(width: 10.0), // 添加一些间隔
          Text(
            "Username",
            style: TextStyle(
              color: Color(0xFF000000),
            ),
          ), // 这是用户名，你可以根据需要修改
        ],
      )
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).hintColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: GestureDetector(
                onTap: () {
                  print("On tap");
                },
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(hintText: _msg),
                  onChanged: _handleTextChange,
                  focusNode: _focusNode,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                color: _getSendButtonColor(),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTextChange(value) {
    setState(() {
      _msg = value;
      if (value == "") {
        _msg = _hint;
      }
    });
  }

  Color _getSendButtonColor() {
    if (_msg == _hint || _msg == "") {
      return Colors.grey;
    }
    return Colors.blue;
  }

  void _handleSubmitted(String text) {
    _focusNode.requestFocus();
    if (text == "") {
      return;
    }
    _textController.clear();
    _msg = _hint;
    Message message = Message(
      text: text,
      isSendByMe: Random().nextBool(),
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
}

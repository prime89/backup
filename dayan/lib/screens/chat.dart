import 'dart:io';
import 'dart:math';
import 'package:dayan/common/bubble.dart';
import 'package:dayan/common/chat_angle.dart';
import 'package:dayan/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../common/emoji.dart';


enum ChatMessageTypes {
  camera,
  image,
  voice,
  emoji,
  more,
  none,
}

class ChatPage extends StatelessWidget {
  final String title;
  final _animationKey = GlobalKey<ImplicitlyAnimatedWidgetState>();
  final TrackingScrollController _trackingScrollController = TrackingScrollController(
    keepScrollOffset: true,
  );

  ChatPage({
    Key key,
    @required this.title,
  }): super(key: key);


  Widget _buildInputBox(BuildContext context) {
    print('=======');
    double padding = MediaQuery.of(context).padding.bottom;
    return AnimatedContainer(
      // key: _animationKey,
      duration: Duration(milliseconds: 1000),
      padding: EdgeInsets.only(bottom: padding),
      height: padding + 60,
      curve: Curves.easeOut,
      child: CupertinoTextField(
        placeholder: 'faxiaoxi',
      ),
    );
  }

  Widget build(BuildContext context) {
    print('rebuild root');
    return Scaffold(
      backgroundColor: Color(0xeFFF5F6FA),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text(this.title),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                controller: _trackingScrollController,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                    ListTile(
                      title: Text('Flutter 高性能原理浅析- 掘金'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildInputBox(context),
        ],
      ),
    );
  }
}
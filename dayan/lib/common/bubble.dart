import 'package:dayan/common/chat_angle.dart';
import 'package:dayan/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bubble extends StatelessWidget {
  final Message message;

  Bubble({
    Key key,
    @required this.message,
  }) : super(key: key);

  Widget build(BuildContext context) {
    if (message.content == null) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/test.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6),
            padding: EdgeInsets.all(0),
            child: CustomPaint(
              size: Size(10, 20),
              painter: ChatAnglePainter(),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 0, right: 60),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: message.type == MessageTypes.text
                ? Text(
                  message.content, 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ) : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
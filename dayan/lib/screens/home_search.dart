import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CupertinoTextField(
                      autofocus: true,
                      placeholder: '搜索',
                      placeholderStyle: TextStyle(
                        color: Color(0xeFFB6BAC1),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                          color: Colors.white,
                        ),
                        color: Color(0xeFFF5F6FA),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      prefix: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.search, 
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 36,
                    margin: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      child: Material(
                        child: Text(
                          '取消',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Material(
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  
}
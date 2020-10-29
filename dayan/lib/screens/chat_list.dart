import 'chat_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class MessageView extends StatefulWidget{
  @override
  _MessageViewState createState() => new _MessageViewState();
}

class _MessageViewState extends State with AutomaticKeepAliveClientMixin{

  String _community = '万科城';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 0.0,
            title: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      '消息',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildListTile(context, index);
              }, 
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSearchInput(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: CupertinoTextField(
        placeholder: '搜索',
        decoration: BoxDecoration(
          border: Border.all(
            width: 0,
            color: Colors.white,
          ),
          color: Color(0xeFFFAFAFA),
          borderRadius: BorderRadius.circular(8.0),
        ),
        maxLines: null,
        textAlign: TextAlign.center,
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return SearchPage();
            },
            transitionDuration: Duration(microseconds: 1000),
            transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
              // return ScaleTransition(
              //   scale: animation,
              //   child: child,
              //   alignment: Alignment(0, -0.7),
              // );
              var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }
          ));
        },
      ),
    );
  }

  Widget _buildListTile(BuildContext context, int index) {
    if (index == 0) {
      return _buildSearchInput(context);
    }
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/test.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6.0),
          // border: Border.all(
          //   color: Color(0xe333333),
          //   width: 1,
          //   style: BorderStyle.solid,
          // )
        ),
      ),
      title: Container(
        child: Text(
          '业主群',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xeFF45464a),
          )  
        ),
      ),
      subtitle: Container(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          '啥消息来了，老王',
          style: TextStyle(
            color: Color(0xeFFa6abb0),
          ),
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: <Widget>[
            Text(
              '晚上6:06',
              style: TextStyle(
                color: Color(0xeFFd6d5d9),
                fontSize: 12,
              )
            ),
            Container(
              // alignment: Alignment.centerRight,
              width: 16,
              margin: EdgeInsets.only(top: 8, left: 34),
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Color(0xeFFfb683e),
                  borderRadius: BorderRadius.circular(8)
                  
                ),
                child: Text(
                  '8',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {

      },
    );
  }
}
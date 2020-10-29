import 'chat.dart';
import 'home_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeView extends StatefulWidget{
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State with AutomaticKeepAliveClientMixin{
  String _community = '万科城';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 0.0,
            title: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      _community,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0.0),
                    padding: EdgeInsets.only(top: 12),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF7A29),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Text(
                        '业主',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Icon(
                        //   Icons.search,
                        //   color: Colors.black,
                        // ),
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
                return _buildItem(context, index);
              }, 
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSearchInput(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: CupertinoTextField(
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
              //   alignment: Alignment(-1, 1),
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

  Widget _buildListTile() {
    return ListTile(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(  
          builder: (context)=>ChatPage(
            title: '小芳',
          ),
        ));
      },
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
    );
  }

  Widget _buildChatList(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              children: <Widget>[
                Text(
                  '小区群聊',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          _buildListTile(),
          _buildListTile(),
          _buildListTile(),
        ],
      ),      
    );
  }

  Widget _buildNotice(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),      
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              '小区公告',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),

          ),
          Expanded(
            child: Container(
              child: Text('停水了'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTransaction(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 8, 0),
                child: Text(
                  '小区事务',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xeFF333333),
                  ),
                ),
              ),
              Text(
                '积极参与小区建设，创造美好社区',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xeFFAAAAAA),
                  // fontFamily: 'PingFang',
                ),  
              ),
            ],
          ),

          CarouselSlider(
            height: 140,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.92,
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: 140,
                    padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                    margin: const EdgeInsets.fromLTRB(0, 10, 10, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xe1A000000),
                          offset: Offset(0, 4.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('27/9'),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text('第一届业委会选举'),
                                      Text('地址：万科社区'),
                                      Text('报名截止'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  );
                },
              );
            }).toList(),
          ),
          
        ],
      ),
    );
  }

  Widget _buildConvention(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 8, 0),
                child: Text(
                  '小区公约',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xeFF333333),
                    // fontFamily: 'PingFang',
                  ),
                ),
              ),
              Text(
                '遵守小区管理规定，从我做起',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xeFFAAAAAA),
                  // fontFamily: 'PingFang',
                ),  
              ),
            ],
          ),
          
          CarouselSlider(
            height: 140,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: 140,
                    // width: 280,
                    padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                    margin: const EdgeInsets.fromLTRB(0, 10, 20, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xe1A000000),
                          offset: Offset(0, 4.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('27/9'),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text('第一届业委会选举'),
                                      Text('地址：万科社区'),
                                      Text('报名截止'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSlogen(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '好好社区',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xeFFD2D2D2),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 20),                
                child: Text(
                  '-为业主服务，保障小区公共权益-',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xeFFD2D2D2),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      color: Color(0xeFFF5F6FA),
      child: Column(
        children: <Widget>[
          _buildSearchInput(context),
          _buildChatList(context),
          _buildNotice(context),
          _buildTransaction(context),
          _buildConvention(context),
          _buildSlogen(context),
        ],
      ),
    );
  }
}
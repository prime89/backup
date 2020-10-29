import 'package:flutter/material.dart';

class _Page{
  _Page({ this.label });

  final String label;
}

final List<_Page> _tabs = [
  _Page(label: '小区事务'),
  _Page(label: '小区公约'),
];

class HomeView extends StatefulWidget{
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State{
  String _community = '万科城';

  String _appName = '好好社区';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                backgroundColor: Colors.white,
                title: Text(_community, style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                )),
                pinned: true,
                expandedHeight: 150.0,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: ,
                )
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _tabs.map<Widget>((_Page page) {
            return Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  key: PageStorageKey<_Page>(page),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      sliver: SliverFixedExtentList(
                        itemExtent: 80.0,
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                              //创建列表项      
                            return ListTile(
                              leading: Container(
                                width: 60,
                                height: 60,
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
                              title: Text(
                                '业主群',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                )  
                              ),
                              subtitle: Text('啥消息来了，老王'),
                              trailing: Text("8:15"),
                            );
                          },
                          childCount: 50 //50个列表项
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
  
}
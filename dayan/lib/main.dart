import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/chat_list.dart';
import 'screens/setting.dart';

void main() {
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: '好好社区',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        fontFamily: 'PingFang SC',
        // brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;
  final List<StatefulWidget> _navigationViews = [HomeView(), MessageView(), SettingView()];

  void initState() {
    super.initState();
    this._pageController =PageController(initialPage: this._currentIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: PageView(
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _navigationViews.map((view) {
          return Container(
            color: Colors.white,
            child: view,
          );
        }).toList(),
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xeFFFF9C4C),
        unselectedItemColor: Color(0xeFFAAAAAA),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('社区'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            // _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _pageController.jumpToPage(index);
            // _navigationViews[_currentIndex].controller.forward();
          });
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //   backgroundColor: Color(0xeFFFF9C4C),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

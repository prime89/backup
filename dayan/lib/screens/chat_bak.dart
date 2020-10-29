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


enum ChatIcons {
  camera,
  image,
  voice,
  emoji,
  more,
  none,
}

class ChatView extends StatelessWidget {
  final String title;

  Widget build() {
    
  }
}

class ChatView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _ChatViewState();
  
}


class _ChatViewState extends State with WidgetsBindingObserver {
  ChatIcons activeIcon;
  double _overlap = 0;
  double _height = 0.0;
  double _prevHeight = 0.0;
  var _image;
  bool _scrollPhysics = true;
  bool _sysScroll = false;
  String title = '小洞';
  ScrollController _scrollController = ScrollController(
    // keepScrollOffset: true,
  );
  final _focusNode = FocusNode();
  final _animationKey = new GlobalKey<ImplicitlyAnimatedWidgetState>();
  Function(AnimationStatus) _animationListener;

  @override
  void initState() {
    super.initState();
    activeIcon = ChatIcons.none;

    WidgetsBinding.instance.addObserver(this);
  }

  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resize();
      print('=====');
      if (_animationListener == null) {
        _animationListener = _animationStatusChanged;
        _animationKey.currentState.animation.addStatusListener(_animationListener);
      }
    });
  }

  void _animationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_height != 0.0 && _prevHeight <= _height) {
        if (_overlap != 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });
        } else {
          _scrollToBottom();
        }
      }
      
    }
  }

  void _unFocus() {
    if (context == null) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      activeIcon = ChatIcons.none;
      _prevHeight = _height;
      _height = 0.0;
      _overlap = 0.0;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _animationKey.currentState?.animation?.removeStatusListener(_animationListener);
    super.dispose();
  }

  void _resize() {
    if (context == null) {
      return;
    }

    // Calculate Rect of widget on screen
    final object = context.findRenderObject();
    final box = object as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    final widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      box.size.width,
      box.size.height,
    );

    // Calculate top of keyboard
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final screenInsets = mediaQuery.viewInsets;
    final keyboardTop = screenSize.height - screenInsets.bottom;

    final overlap = max(0.0, widgetRect.bottom - keyboardTop);

    if (overlap != _overlap) {
      setState(() {
        _overlap = overlap;
        _prevHeight = _height;
        _height = activeIcon == ChatIcons.none ? overlap: 300;
      });
    }
  }

  void _scrollToBottom() {
    setState(() {
      _scrollPhysics = false;
    });
    
    _scrollController.position.moveTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeOut,
    ).then((_) {
      setState(() {
        _scrollPhysics = true;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    print('chat root rebuild');
    return Container(
      color: Color(0xeFFF5F6FA),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Column(
          children: <Widget>[
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                removeTop: true,
                child: Container(
                  // duration: Duration(milliseconds: 200),
                  // curve: Curves.easeOut,
                  // padding: EdgeInsets.only(bottom: _height),
                  child: GestureDetector(
                    onTap: () {
                      _unFocus();
                    },
                    child: Scrollbar(
                      child: NotificationListener<ScrollEndNotification>(
                        child: ListView(
                          shrinkWrap: true,
                          dragStartBehavior: DragStartBehavior.start,
                          physics: _scrollPhysics ? BouncingScrollPhysics() : ClampingScrollPhysics(),
                          controller: _scrollController,
                          children: <Widget>[
                            Bubble(
                              message: Message(
                                text: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                              ),
                            ),
                            Bubble(
                              message: Message(
                              text: _prevHeight.toString(),
                            )),
                            Bubble(
                              message: Message(
                              text: _height.toString(),
                            )),
                            Bubble(
                              message: Message(
                              text: _overlap.toString(),
                            )),
                            Bubble(
                              message: Message(
                                text: '11',
                              // text: _scrollController?.position?.maxScrollExtent?.toString(),
                            )),
                            Bubble(
                              message: Message(
                              text: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                            )),
                            Bubble(
                              message: Message(
                              text: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                            )),
                            Bubble(
                              message: Message(
                              text: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                            )),
                            Bubble(
                              message: Message(
                              text: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                            )),
                            Bubble(
                              message: Message(
                              text: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                            )),
                            
                            Bubble(
                              message: Message(
                              image: _image,
                            )),

                            
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              // padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  buildInput(context),
                  buildInputBar(context),
                  buildChatBottomBox(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    print('chat app bar rebuild');
    return AppBar(
      primary: true,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () { 
              Navigator.pop(context);
            },
          );
        },
      ),
      title: Center(
        // color: Colors.black,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {

          },
        )
      ],
      backgroundColor: Color(0xeFFF5F6FA),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
    );
  }

  Widget buildMessage(BuildContext context, Message message) {
    if (message.image == null && message.text == null) {
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
              child: message.image == null
                ? Text(
                  message.text, 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ) : Image.file(message.image),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: CupertinoTextField(
      // autofocus: false,
        focusNode: _focusNode,
        placeholder: '发消息...',
        placeholderStyle: TextStyle(
          color: Color(0xeFFB6BAC1),
          fontSize: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0,
            color: Colors.white,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        minLines: 1,
        maxLines: 20,
        textAlign: TextAlign.left,
        onTap: () {
          setState(() {
            activeIcon = ChatIcons.none;
          });
        },
      ),
    );
  }

  Widget buildInputBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildCameraIconButton(context),
          buildImageIconButton(context),
          buildVoiceIconButton(context),
          buildEmojiIconButton(context),
          buildMoreIconButton(context),
        ],
      ),
    );
  }

  Widget buildCameraIconButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: IconButton(
        icon:  Icon(Icons.camera_alt),
        onPressed: () {
          _focusNode.unfocus();
          getImageFromCamera();
          // setState(() {
          //   activeIcon = ChatIcons.camera;
          //   _bottomHeight = 0;
          // });
        },
      ),
    );
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Widget buildImageIconButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: IconButton(
        icon:  Icon(Icons.image),
        onPressed: () {
          _focusNode.unfocus();
          // setState(() {
          //   activeIcon = ChatIcons.image;
          //   _bottomHeight = 0;
          // });
          getImageFromGallery();
        },
      ),
    );
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget buildVoiceIconButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: IconButton(
        icon:  Icon(Icons.settings_voice),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            activeIcon = ChatIcons.voice;
          });
        },
      ),
    );
  }

  Widget buildEmojiIconButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: IconButton(
        icon:  Icon(Icons.mood),
        onPressed: () {
          if (activeIcon == ChatIcons.emoji) {
            FocusScope.of(context).requestFocus(_focusNode);
            setState(() {
              activeIcon = ChatIcons.none;
            });
          } else {
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              activeIcon = ChatIcons.emoji;
              _prevHeight = 0;
              _height = 300;
            });
          }
        },
      ),
    );
  }

  Widget buildMoreIconButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: IconButton(
        icon:  Icon(Icons.expand_more),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            activeIcon = ChatIcons.more;
          });
        },
      ),
    );
  }

  Widget buildChatBottomBox(BuildContext context) {
    return AnimatedContainer(
      key: _animationKey,
      padding: EdgeInsets.only(bottom: _overlap),
      height: max(MediaQuery.of(context).padding.bottom, _height),
      duration: Duration(
        milliseconds: 60,
      ),
      curve: Curves.easeOut,
      child: buildActiveContainer(context),
    );
  }

  Widget buildActiveContainer(BuildContext context) {
    if (activeIcon == ChatIcons.camera) {
      return Container(
        height: MediaQuery.of(context).padding.bottom,
      );
    } else if (activeIcon == ChatIcons.image) {
      return Container(
        height: MediaQuery.of(context).padding.bottom,
      );
    } else if (activeIcon == ChatIcons.voice) {
      return Container(
        height: MediaQuery.of(context).padding.bottom,
      );
    } else if (activeIcon == ChatIcons.emoji) {
      return buildEmojiPicker(context);
    } else if (activeIcon == ChatIcons.more) {
      return Container(
        height: MediaQuery.of(context).padding.bottom,
      );
    } else {
      return Container(
        height: MediaQuery.of(context).padding.bottom,
      );
    }
  }

  Widget buildEmojiPicker(BuildContext context) {
    return EmojiPicker(
      rows: 103,
      columns: 7,
      bgColor: Colors.white,
      buttonMode: ButtonMode.CUPERTINO,
      recommendKeywords: ['racing', 'horse'],
      onEmojiSelected: (emoji, category) {
        print(emoji);
      },
    );
  }
}
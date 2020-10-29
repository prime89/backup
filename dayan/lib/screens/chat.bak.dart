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

class ChatMessageBody extends StatefulWidget {
  final Function onTap;

  ChatMessageBody({
    Key key,
    this.onTap,
  }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChatMessageBodyState();
  }
}

class _ChatMessageBodyState extends State<ChatMessageBody> {
  final ScrollController _scrollController = ScrollController();
  bool _scrollPhysics = true;
  
  
  List<Message> messages = List();
  var _image;

  void sendImage(image) {
    setState(() {
      _image = image;
    });
  }

  void scrollToBottom() {
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: GestureDetector(
          onTap: () {
            widget.onTap();
          },
          child: Scrollbar(
            child: ListView(
              shrinkWrap: true,
              dragStartBehavior: DragStartBehavior.start,
              physics: _scrollPhysics ? BouncingScrollPhysics() : ClampingScrollPhysics(),
              controller: _scrollController,
              children: <Widget>[
                Bubble(
                  message: Message(
                    content: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                  ),
                ),
                Bubble(
                  message: Message(
                    content: '11',
                  // text: _scrollController?.position?.maxScrollExtent?.toString(),
                )),
                Bubble(
                  message: Message(
                  content: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                )),
                Bubble(
                  message: Message(
                  content: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                )),
                Bubble(
                  message: Message(
                  content: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                )),
                Bubble(
                  message: Message(
                  content: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                )),
                Bubble(
                  message: Message(
                  content: '在吗？们将画笔的颜色改成红色,样式改为填充们将sssss画笔的颜色改成红色,样式改为填充们将画笔的颜色改成红色,样式改为填充',
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatInputBar extends StatelessWidget {
  final Function onTap;
  final FocusNode focusNode;

  ChatInputBar({
    Key key,
    @required this.onTap,
    @required this.focusNode,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: CupertinoTextField(
      // autofocus: false,
        focusNode: focusNode,
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
        onTap: onTap,
      ),
    );
  }
}

class CameraIconButton extends StatelessWidget {
  final Function onImagePicked;

  CameraIconButton({
    Key key,
    @required this.onImagePicked,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: IconButton(
        icon:  Icon(Icons.camera_alt),
        onPressed: () {
          getImageFromCamera();
        },
      ),
    );
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    onImagePicked(image);
  }
}

class ImageIconButton extends StatelessWidget {
  final Function onImagePicked;

  ImageIconButton({
    Key key,
    @required this.onImagePicked,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: IconButton(
        icon:  Icon(Icons.image),
        onPressed: () {
          getImageFromGallery();
        },
      ),
    );
  }
  
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    onImagePicked(image);
  }
}

class VoiceIconButton extends StatelessWidget {
  final Function onSelect;

  VoiceIconButton({
    Key key,
    @required this.onSelect,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: IconButton(
        icon:  Icon(Icons.settings_voice),
        onPressed: () {
          onSelect(ChatIcons.voice);
        },
      ),
    );
  }
}

class EmojiIconButton extends StatelessWidget {
  final Function onSelect;

  EmojiIconButton({
    Key key,
    @required this.onSelect,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: IconButton(
        icon:  Icon(Icons.mood),
        onPressed: () {
          onSelect(ChatIcons.emoji);
        },
      ),
    );
  }
}

class MoreIconButton extends StatelessWidget {
  final Function onSelect;

  MoreIconButton({
    Key key,
    @required this.onSelect,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: IconButton(
        icon:  Icon(Icons.expand_more),
        onPressed: () {
          onSelect(ChatIcons.more);
        },
      ),
    );
  }
}


class ChatButtonsBar extends StatelessWidget {
  final Function onImagePicked;
  final Function onChanged;

  ChatButtonsBar({
    Key key,
    this.onImagePicked,
    this.onChanged,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CameraIconButton(
            onImagePicked: onImagePicked,
          ),
          ImageIconButton(
            onImagePicked: onImagePicked,
          ),
          VoiceIconButton(
            onSelect: onChanged,
          ),
          EmojiIconButton(
            onSelect: onChanged,
          ),
          MoreIconButton(
            onSelect: onChanged,
          ),
        ],
      ),
    );
  }
}

class ChatIconExtContainer extends StatefulWidget {
  final Function onAnimatedCompleted;
  final FocusNode focusNode;

  ChatIconExtContainer({
    Key key,
    this.focusNode,
    this.onAnimatedCompleted,
  }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChatIconExtContainerState();
  }
}

class _ChatIconExtContainerState extends State<ChatIconExtContainer>  with WidgetsBindingObserver{
  final _animationKey = GlobalKey<ImplicitlyAnimatedWidgetState>();
  Function(AnimationStatus) _animationListener;
  ChatIcons activeIcon = ChatIcons.none;
  double _overlap = 0;
  double _height = 0.0;
  double _prevHeight = 0.0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void setActiveIcon(ChatIcons icon) {
    print('set active icon');
    if (icon == ChatIcons.none) {
      setState(() {
        activeIcon = ChatIcons.none;
      });
      return;
    }

    if (activeIcon == icon) {
      FocusScope.of(context).requestFocus(widget.focusNode);
      setState(() {
        activeIcon = ChatIcons.none;
      });
    } else {
      widget.focusNode.unfocus();
      setState(() {
        activeIcon = icon;
        _prevHeight = 0;
        _height = 300;
      });
    }
  }

  void unfocusByBodyTapping() {
    widget.focusNode.unfocus();
    setState(() {
      activeIcon = ChatIcons.none;
      _prevHeight = _height;
      _height = 0.0;
      _overlap = 0.0;
    });
  }

  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resize();
    });
  }

  void _animationStatusChanged(AnimationStatus status) {
    print('changed');
    if (status == AnimationStatus.completed) {
      print('${this._height}==${this._prevHeight}==${this._overlap}');
      if (_height != 0.0 && _prevHeight <= _height) {
        if (_overlap != 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onAnimatedCompleted();
          });
        } else {
          widget.onAnimatedCompleted();
        }
      }
      
    }
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

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationKey.currentState?.animation?.removeStatusListener(_animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_animationListener == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _animationListener = _animationStatusChanged;
        _animationKey.currentState.animation.addStatusListener(_animationListener);
      });
    }
    return AnimatedContainer(
      key: _animationKey,
      padding: EdgeInsets.only(bottom: _overlap),
      height: max(MediaQuery.of(context).padding.bottom, _height),
      duration: Duration(
        milliseconds: 60,
      ),
      curve: Curves.easeOut,
      child: _buildActiveContainer(context),
    );
  }

  Widget _buildActiveContainer(BuildContext context) {
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
      return _buildEmojiPicker(context);
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

  Widget _buildEmojiPicker(BuildContext context) {
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

class ChatBottomBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatBottomBoxState();
  }

}
class ChatBottomBoxState extends State<ChatBottomBox> {
  final GlobalKey<_ChatIconExtContainerState> chatIconExtContainerKey;
  final Function onImagePicked;
  final Function onAnimatedCompleted;
  final FocusNode focusNode;

  ChatBottomBoxState({
    Key key,
    this.focusNode,
    this.chatIconExtContainerKey,
    this.onImagePicked,
    this.onAnimatedCompleted,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    print('chat bottom rebuild');
    return Container(
      color: Colors.white,
      // padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ChatInputBar(
            onTap: () {
              chatIconExtContainerKey.currentState.setActiveIcon(ChatIcons.none);
            },
            focusNode: focusNode,
          ),
          ChatButtonsBar(
            onImagePicked: onImagePicked,
            onChanged: (ChatIcons activeIcon) {
              chatIconExtContainerKey.currentState.setActiveIcon(activeIcon);
            },
          ),
          ChatIconExtContainer(
            key: chatIconExtContainerKey,
            focusNode: focusNode,
            onAnimatedCompleted: onAnimatedCompleted,
          ),
        ],
      ),
    );
  }
}



class ChatBody extends StatelessWidget {
  final GlobalKey<_ChatMessageBodyState> _key = GlobalKey<_ChatMessageBodyState>();
  final GlobalKey<_ChatIconExtContainerState> _chatIconExtContainerKey = GlobalKey<_ChatIconExtContainerState>();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    print('chat body rebuild');
    return Column(
      children: <Widget>[
        ChatMessageBody(
          key: _key,
          onTap: () {
            _chatIconExtContainerKey.currentState.unfocusByBodyTapping();
          },
        ),
        ChatBottomBox(
          focusNode: _focusNode,
          chatIconExtContainerKey: _chatIconExtContainerKey,        
          onImagePicked: (image) {
            _key.currentState.sendImage(image);
          },
          onAnimatedCompleted: () {
            _key.currentState.scrollToBottom();
          },
        ),
      ],
    );
  }

}

class ChatView extends StatelessWidget {
  final String title;

  ChatView({
    Key key,
    @required this.title
  }): super(key: key);

  Widget build(BuildContext context) {
    print('chat view rebuild');
    return Scaffold(
      backgroundColor: Color(0xeFFF5F6FA),
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: ChatBody(),
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
}
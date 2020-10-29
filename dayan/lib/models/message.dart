
import 'dart:io';

import 'package:flutter/widgets.dart';

import 'user.dart';

enum MessageTypes {
  image,
  text,
  video,
  link,
  site,
  microApp,
}

class Chat {
  final BigInt id;
  final String name;

  Chat({
    this.id,
    this.name,
  });
}

class Message {
  final Chat from;
  final User sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String content;
  final MessageTypes type;
  final bool unread;

  Message({
    this.from,
    this.sender,
    this.time,
    this.content,
    this.unread,
    this.type,
  });
}
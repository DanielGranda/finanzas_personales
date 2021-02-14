import 'package:flutter/material.dart';

class Chat {
  String id;
  String name;
  int votes;

  Chat({@required this.id, @required this.name, @required this.votes});

  factory Chat.fromMap(Map<String, dynamic> obj) => Chat(
        id: obj['id'],
        name: obj['name'],
        votes: obj['votes'],
      );
}

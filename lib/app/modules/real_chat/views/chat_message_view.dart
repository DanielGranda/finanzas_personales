import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatMessageView extends GetView {
  final String textChat;
  final String uid;

  const ChatMessageView({Key key, this.textChat, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123'
          ?
          //!-------------------Mensaje Propio------------------!//
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 7, left: 40, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Get.theme.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textChat,
                    style: TextStyle(color: Get.theme.primaryColorLight),
                  ),
                ),
              ))
          //!-------------------Mensaje otra persona------------------!//
          : Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 7, left: 40, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Get.theme.hintColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textChat,
                        style: TextStyle(color: Get.theme.accentColor),
                      ),
                    ),
                  )),
            ),
    );
  }
}

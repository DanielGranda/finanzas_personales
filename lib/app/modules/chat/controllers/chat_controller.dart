import 'dart:async';

import 'package:finanzas_personales/app/modules/chat/providers/socket_provider.dart';
import 'package:finanzas_personales/app/modules/chat/models/chat_models.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController with StateMixin {
  final List<Chat> chat = [
    Chat(id: '1', name: 'Daniel', votes: 1),
    Chat(id: '2', name: 'Juan', votes: 2),
    Chat(id: '3', name: 'Victor', votes: 3),
  ].obs;

  final textController = TextEditingController();
  final SocketController socketController = Get.find();

  @override
  void onInit() {
    super.onInit();
    socketController.initConfigSocket();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void validationText(String name) {
    if (name.length > 1) {
      Get.back();

      Get.snackbar(
        'Correcto',
        'Banda:' + name + ' creada',
      );

      this.chat.add(Chat(id: DateTime.now().toString(), name: name, votes: 3));
    } else {
      Get.snackbar('Error', 'Agregar nombre');
    }
  }
}

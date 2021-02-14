import 'package:finanzas_personales/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatView'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.chat.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(controller.chat[index].id),
              onDismissed: (direction) {
                print(controller.chat[index].id);
              },
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(controller.chat[index].name.substring(0, 2)),
                ),
                title: Text(controller.chat[index].name),
                trailing: Text('${controller.chat[index].votes}'),
                onTap: () {
                  print(controller.chat[index].name);
                },
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
              title: 'Nombre del Candidato',
              content: TextField(
                controller: controller.textController,
              ),
              textConfirm: 'Agregar',
              confirmTextColor: Colors.white,
              onConfirm: () {
                controller.validationText(controller.textController.text);
              });
        },
      ),
    );
  }
}

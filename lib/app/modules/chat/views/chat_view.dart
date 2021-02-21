import 'package:finanzas_personales/app/Themes/theme_services.dart';
import 'package:finanzas_personales/app/modules/chat/providers/socket_provider.dart';
import 'package:finanzas_personales/app/modules/theme/controllers/theme_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  final themeData = GetStorage();
  @override
  Widget build(BuildContext context) {
    themeData.writeIfNull('darkMode', false);
    bool isDarkMode = themeData.read('darkMode');
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Obx(() => Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.only(right: 30),
                child:
                    // ignore: unrelated_type_equality_checks
                    (controller.socketController.status == ServerStatus.Online)
                        ? Icon(
                            Icons.check_box,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.cached_outlined,
                            color: Colors.red,
                          ),
              ))
        ],
        //  title: Obx(() => Text(controller.socketController.status.toString())),
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
      //!-------------------Barra lateral de pantalla------------------!//
      drawer: Drawer(
          child: ListView(
        children: [
          SwitchListTile(
              value: isDarkMode,
              onChanged: (bool value) {
                themeData.write('darkMode', value);
              })
        ],
      )),
      //!------------------Botones Inferiores------------------!//
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              backgroundColor: Get.theme.accentColor,
              child: Icon(Icons.mediation),
              onPressed: () {
                ThemeService().changeThemeMode();
              }),
          FloatingActionButton(
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
        ],
      ),
    );
  }
}

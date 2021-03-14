import 'dart:io';

import 'package:finanzas_personales/app/modules/SingIn/controllers/sing_in_controller.dart';
import 'package:finanzas_personales/app/modules/real_chat/controllers/real_chat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatPrivateView extends GetView<RealChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GetBuilder<SingInController>(
            init: SingInController(),
            builder: (_) {
              return Text(_.usuario.nombre,
                  style: Get.theme.textTheme.headline6);
            },
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              //!-------------------Mensajes------------------!//
              Flexible(
                  child: Obx(() => ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: controller.message.length,
                        itemBuilder: (BuildContext context, int index) {
                          return controller.message[index];
                        },
                      ))),
              Divider(),
              //!-------------------Escribir mensaje------------------!//
              Container(
                color: Get.theme.primaryColor,
                height: Get.height * 0.1,
                child: SafeArea(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Flexible(
                          child: TextField(
                        controller: controller.textEditingController,
                        onSubmitted: (_) {
                          controller.handleSumit(_);
                        },
                        onChanged: (String text) {
                          if (text.trim().length > 0) {
                            controller.writing.value = true;
                          } else {
                            controller.writing.value = false;
                          }
                        },
                        decoration: InputDecoration.collapsed(
                          fillColor: Colors.black,
                          hintText: 'Enviar mensaje',
                        ),
                        focusNode: controller.focusNode,
                      )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Platform.isIOS
                            ? CupertinoButton(
                                child: Text('Enviar'), onPressed: () {})
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Obx(() => IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        color: controller.writing.value
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                      onPressed: controller.writing.value
                                          ? () => controller.handleSumit(
                                              controller
                                                  .textEditingController.text
                                                  .trim())
                                          : null,
                                    )),
                              ),
                      )
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}

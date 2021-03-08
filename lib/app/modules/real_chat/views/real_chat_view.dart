import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/real_chat_controller.dart';

class RealChatView extends GetView<RealChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RealChatView'),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.only(right: Get.width * 0.05),
              child: Icon(Icons.check_circle),
            )
          ],
        ),
        body: Obx(() => SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              onRefresh: controller.loadingUserRefresh,
              header: WaterDropHeader(),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: controller.usuariosRealTimeList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(controller.usuariosRealTimeList[index].nombre
                          .substring(0, 2)),
                    ),
                    title: Text(controller.usuariosRealTimeList[index].nombre),
                    trailing: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color:
                              controller.usuariosRealTimeList[index].onlineBool
                                  ? Colors.greenAccent
                                  : Colors.red),
                    ),
                  );
                },
              ),
            )));
  }
}

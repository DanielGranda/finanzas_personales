import 'package:finanzas_personales/app/modules/SingIn/controllers/sing_in_controller.dart';
import 'package:finanzas_personales/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class BottonLogin extends GetView<SingInController> {
  const BottonLogin({
    Key key,
    @required this.showShadow,
  }) : super(key: key);

  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceInOut,
          top: controller.isSignupScreen.value ? 535 : 430,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    if (showShadow)
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1.5,
                        blurRadius: 10,
                      )
                  ]),
              child: !showShadow
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange[200], Colors.red[400]],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ]),
                      child: controller.isSignupScreen.value
                          //!-------------Boton Registro-----------!//
                          ? IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                if (await Vibration.hasVibrator()) {
                                  Vibration.vibrate();
                                  Get.toNamed(Routes.HOME);
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                            )
                          //!-------------Boton Ingreso-----------!//
                          : IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                if (await Vibration.hasVibrator()) {
                                  Vibration.vibrate();
                                }
                                Get.toNamed(Routes.CATEGORY);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                            ))
                  : Center(),
            ),
          ),
        ));
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
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
                              colors: controller.autenticando.value
                                  ? [Colors.grey[200], Colors.grey[400]]
                                  : [Colors.orange[200], Colors.red[400]],
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
                                FocusScope.of(context).unfocus();
                                if (controller.signUpKey.currentState
                                    .saveAndValidate()) {
                                  final registroOk = await controller.registro(
                                      controller.signUpKey.currentState
                                          .value['userUp'.trim()],
                                      controller.signUpKey.currentState
                                          .value['emailUp'.trim()],
                                      controller.signUpKey.currentState
                                          .value['passwordUp'.trim()]);
                                  if (registroOk == true) {
                                    //todo socket login
                                    Get.offNamed(Routes.HOME);
                                  } else {
                                    Get.defaultDialog(
                                      title: 'Registro Incorrecto',
                                      middleText: registroOk,
                                      middleTextStyle:
                                          Get.theme.textTheme.bodyText1,
                                      radius: 20,
                                    );
                                  }

                                  print(
                                    controller.signUpKey.currentState.value,
                                  );

                                  if (await Vibration.hasVibrator()) {
                                    Vibration.vibrate();
                                  }
                                } else {}
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                            )
                          //!-------------Boton Ingreso-----------!//
                          : IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                if (controller.signInKey.currentState
                                    .saveAndValidate()) {
                                  final loginOk = await controller.login(
                                      controller.signInKey.currentState
                                          .value['email'.trim()],
                                      controller.signInKey.currentState
                                          .value['password'.trim()]);
                                  if (loginOk) {
                                    //todo socket login
                                    Get.offNamed(Routes.HOME);
                                  } else {
                                    Get.defaultDialog(
                                      title: 'Login Incorrecto',
                                      middleText: 'Revisar credenciales',
                                      middleTextStyle:
                                          Get.theme.textTheme.bodyText1,
                                      radius: 20,
                                    );
                                  }

                                  print(
                                    controller.signInKey.currentState.value,
                                  );

                                  if (await Vibration.hasVibrator()) {
                                    Vibration.vibrate();
                                  }
                                } else {}
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

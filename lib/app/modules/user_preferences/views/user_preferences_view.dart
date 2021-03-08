import 'dart:ui';

import 'package:finanzas_personales/app/Themes/Theme_services.dart';
import 'package:finanzas_personales/app/routes/app_pages.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vibration/vibration.dart';

import '../controllers/user_preferences_controller.dart';

class UserPreferencesView extends GetView<UserPreferencesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                height: Get.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Get.theme.unselectedWidgetColor.withOpacity(0.9),
                            BlendMode.colorBurn),
                        image: AssetImage("assets/image/login/fondoLogin4.png"),
                        fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //!-------------------usuario------------------!//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Usuario',
                        style: Get.theme.textTheme.headline6,
                      ),
                      Icon(
                        Icons.supervised_user_circle_outlined,
                        color: Get.theme.primaryColorLight,
                      )
                    ],
                  ),
                  Divider(),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      color: Get.theme.accentColor.withOpacity(0.5),
                      height: Get.height * 0.2,
                      width: Get.width * 0.9,
                      //!-------------------Foto------------------!//
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.arrowCircleLeft,
                            color: Get.theme.unselectedWidgetColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          CircleAvatar(
                            radius: Get.height * 0.08,
                            backgroundColor: Get.theme.accentColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowCircleRight,
                            color: Get.theme.unselectedWidgetColor,
                          ),
                        ],
                      ),
                    ),
                    back: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        color: Get.theme.accentColor.withOpacity(0.5),
                        height: Get.height * 0.2,
                        width: Get.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //!-------------------Inf de usuario------------------!//
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: "Nombre:",
                                      style: Get.theme.textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: "Daniel Granda",
                                          style: Get.theme.textTheme.headline4,
                                        )
                                      ]),
                                ),
                                Divider(),
                                RichText(
                                  text: TextSpan(
                                      text: 'CI:',
                                      style: Get.theme.textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: "1717084592",
                                          style: Get.theme.textTheme.headline4,
                                        )
                                      ]),
                                ),
                                Divider(),
                                RichText(
                                  text: TextSpan(
                                      text: 'Contribuyente:',
                                      style: Get.theme.textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: "Especial",
                                          style: Get.theme.textTheme.headline4,
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //!------------------Conf App------------------!//
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Configuracion App',
                        style: Get.theme.textTheme.headline6,
                      ),
                      Icon(
                        FontAwesomeIcons.cog,
                        color: Get.theme.primaryColorLight,
                      )
                    ],
                  ),
                  Divider(),

                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Get.theme.accentColor.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Configuracion App',
                            style: Get.theme.textTheme.headline4,
                          ),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.palette,
                                color: Get.theme.disabledColor,
                              ),
                              onPressed: () async {
                                ThemeService().changeThemeMode();

                                if (await Vibration.hasVibrator()) {
                                  Vibration.vibrate();
                                }
                                Get.snackbar('Tema', 'Modo activado');
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

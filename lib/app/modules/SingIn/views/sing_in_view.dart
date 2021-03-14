import 'package:finanzas_personales/app/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import '../controllers/sing_in_controller.dart';
import 'local_widget/botton_login.dart';
import 'local_widget/form_builder_general.dart';
import 'local_widget/form_login_mail.dart';

class SingInView extends GetView<SingInController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Get.theme.primaryColor,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                //!-------------Fondo-----------!//
                child: Container(
                  height: Get.height * 0.32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Get.theme.primaryColor.withOpacity(0.9),
                              BlendMode.dstOver),
                          image:
                              AssetImage("assets/image/login/fondoLogin4.png"),
                          fit: BoxFit.contain)),
                  child: Container(
                    padding: EdgeInsets.only(top: Get.height * 0.09, left: 20),
                    color: Color(0xFF3b5999).withOpacity(.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //!-------------Encabezado-----------!//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: Svg(
                              'assets/image/login/logoAmarillo1.1.svg',
                              size: Size(Get.width * 0.3, Get.height * 0.1),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          controller.isSignupScreen.value
                              ? "Control Financiero"
                              : "Seguimiento financiero",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Trick to add the shadow for the submit button
              BottonLogin(showShadow: true),
              //Main Contianer for Login and Signup
              //!-------------Tarjeta de Registro-----------!//
              AnimatedPositioned(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                top: controller.isSignupScreen.value ? 180 : 180,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  height: controller.isSignupScreen.value ? 400 : 300,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5),
                      ]),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isSignupScreen.value = false;
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "INGRESO",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                !controller.isSignupScreen.value
                                                    ? Palette.activeColor
                                                    : Palette.textColor1),
                                      ),
                                      if (!controller.isSignupScreen.value)
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          height: 2,
                                          width: 55,
                                          color: Colors.orange,
                                        )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (await Vibration.hasVibrator()) {
                                      Vibration.vibrate();
                                    }
                                    controller.isSignupScreen.value = true;
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "REGISTRO",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                controller.isSignupScreen.value
                                                    ? Palette.activeColor
                                                    : Palette.textColor1),
                                      ),
                                      if (controller.isSignupScreen.value)
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          height: 2,
                                          width: 55,
                                          color: Colors.orange,
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            if (controller.isSignupScreen.value)
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    //!-------------SingUp-----------!//
                                    FormBuilder(
                                      autovalidateMode: AutovalidateMode.always,
                                      key: controller.signUpKey,
                                      initialValue: {
                                        'date': DateTime.now(),
                                        'accept_terms': false,
                                      },
                                      child: Column(
                                        children: [
                                          //!-------------Password SingUp-----------!//
                                          FormBuilderGeneral(
                                            name: 'userUp',
                                            hintText: 'User name',
                                            icon: Icon(
                                              FontAwesomeIcons.user,
                                              color: Palette.iconColor,
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          //!-------------Email SingUp-----------!//
                                          FormLoginBuilderMail(
                                            name: 'emailUp',
                                          ),
                                          SizedBox(height: 15),
                                          //!-------------Password SingUp-----------!//
                                          FormBuilderGeneral(
                                            name: 'passwordUp',
                                            hintText: '**********',
                                            icon: Icon(
                                              FontAwesomeIcons.lock,
                                              color: Palette.iconColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      margin: EdgeInsets.only(top: 20),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                "By pressing 'Submit' you agree to our ",
                                            style: TextStyle(
                                                color: Palette.textColor2),
                                            children: [
                                              TextSpan(
                                                //recognizer: ,
                                                text: "term & conditions",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (!controller.isSignupScreen.value)
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    //!-------------SingIn-----------!//
                                    FormBuilder(
                                      autovalidateMode: AutovalidateMode.always,
                                      key: controller.signInKey,
                                      initialValue: {
                                        'date': DateTime.now(),
                                        'accept_terms': false,
                                      },
                                      child: Column(
                                        children: [
                                          //!-------------Email SingIn-----------!//
                                          FormLoginBuilderMail(
                                            name: 'email',
                                          ),
                                          SizedBox(height: 20),
                                          //!-------------Password SingIn-----------!//
                                          FormBuilderGeneral(
                                            name: 'password',
                                            hintText: '************',
                                            icon: Icon(
                                              FontAwesomeIcons.lock,
                                              color: Palette.iconColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Obx(() => Checkbox(
                                                  value: controller
                                                      .isRememberMe.value,
                                                  activeColor:
                                                      Palette.textColor2,
                                                  onChanged: (value) {
                                                    controller.isRememberMe
                                                            .value =
                                                        !controller
                                                            .isRememberMe.value;
                                                  },
                                                )),
                                            Text("Remember me",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Palette.textColor1))
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text("Forgot Password?",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Palette.textColor1)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            SizedBox(height: Get.height),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Trick to add the submit button
              BottonLogin(showShadow: false),
              // Bottom buttons
              //!-------------Redes Sociales-----------!//
              Positioned(
                top: Get.height - 130,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(controller.isSignupScreen.value
                        ? "Or Signup with"
                        : "Or Signin with"),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextButton(FontAwesomeIcons.facebook, "Facebook",
                              Get.theme.primaryColor),
                          buildTextButton(FontAwesomeIcons.google, "Google",
                              Get.theme.primaryColor),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Get.theme.primaryColorLight.withOpacity(0.3),
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}

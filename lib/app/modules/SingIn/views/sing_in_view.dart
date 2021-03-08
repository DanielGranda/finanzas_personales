import 'package:finanzas_personales/app/Themes/theme_services.dart';

import 'package:finanzas_personales/app/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import '../controllers/sing_in_controller.dart';
import 'local_widget/botton_login.dart';

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
                          height: 5,
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
              AnimatedPositioned(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                top: controller.isSignupScreen.value ? 200 : 230,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  height: controller.isSignupScreen.value ? 380 : 250,
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
                                        color: !controller.isSignupScreen.value
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
                                        color: controller.isSignupScreen.value
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
                          buildSignupSection(),
                        if (!controller.isSignupScreen.value)
                          buildSigninSection()
                      ],
                    ),
                  ),
                ),
              ),
              // Trick to add the submit button
              BottonLogin(showShadow: false),
              // Bottom buttons
              Positioned(
                top: MediaQuery.of(context).size.height - 100,
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

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline, "info@demouri.com", false, true),
          buildTextField(FontAwesomeIcons.lock, "**********", true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.isRememberMe.value,
                        activeColor: Palette.textColor2,
                        onChanged: (value) {
                          controller.isRememberMe.value =
                              !controller.isRememberMe.value;
                        },
                      )),
                  Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(FontAwesomeIcons.user, "User Name", false, false),
          buildTextField(FontAwesomeIcons.carSide, "email", false, true),
          buildTextField(FontAwesomeIcons.lock, "password", true, false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Obx(() => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isMale.value = true;
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: controller.isMale.value
                                    ? Palette.textColor2
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 1,
                                    color: controller.isMale.value
                                        ? Colors.transparent
                                        : Palette.textColor1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              FontAwesomeIcons.satellite,
                              color: controller.isMale.value
                                  ? Colors.white
                                  : Palette.iconColor,
                            ),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(color: Palette.textColor1),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isMale.value = false;
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: controller.isMale.value
                                    ? Colors.transparent
                                    : Palette.textColor2,
                                border: Border.all(
                                    width: 1,
                                    color: controller.isMale.value
                                        ? Palette.textColor1
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: controller.isMale.value
                                  ? Palette.iconColor
                                  : Colors.white,
                            ),
                          ),
                          Text(
                            "Female",
                            style: TextStyle(color: Palette.textColor1),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
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
          primary: Colors.white,
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

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}

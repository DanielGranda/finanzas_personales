import 'package:finanzas_personales/app/modules/SingIn/views/sing_in_view.dart';
import 'package:finanzas_personales/app/modules/category/views/category_view.dart';
import 'package:finanzas_personales/app/modules/home/controllers/bottom_navigation_controller.dart';
import 'package:finanzas_personales/app/modules/real_chat/views/chat_private_view.dart';
import 'package:finanzas_personales/app/modules/real_chat/views/real_chat_view.dart';
import 'package:finanzas_personales/app/modules/user_preferences/views/user_preferences_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final BottomNavigationController bottomController = Get.find();
    return GetBuilder<BottomNavigationController>(
      builder: (_) {
        return Scaffold(
            body: IndexedStack(
              index: _.tabIndex,
              children: [
                //!-------------------Páginas------------------!//
                ChatPrivateView(),
                RealChatView(),
                UserPreferencesView(),
                SingInView(),
                CategoryView(),
                // LoginView(),
                //ChatView(),
              ],
            ),
            //!-------------------Barra inferior de navegación------------------!//
            bottomNavigationBar: BottomNavigationBar(
              onTap: _.changeTabIndex,
              iconSize: 20,
              currentIndex: _.tabIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Get.theme.accentColor,
              fixedColor: Get.theme.disabledColor,
              unselectedItemColor: Get.theme.unselectedWidgetColor,
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      FontAwesomeIcons.chartBar,
                    )),
                BottomNavigationBarItem(
                    label: 'Status',
                    icon: Icon(
                      FontAwesomeIcons.listAlt,
                    )),
                BottomNavigationBarItem(
                    label: 'Status',
                    icon: Icon(
                      FontAwesomeIcons.bell,
                    )),
                BottomNavigationBarItem(
                    label: 'Status',
                    icon: Icon(
                      FontAwesomeIcons.usersCog,
                    ))
              ],
            ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //!-------------------Fondo de pantalla------------------!//
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor.withOpacity(0.8),
                        BlendMode.darken),
                    image: AssetImage("assets/category/fondoLogin4.png"),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Get.theme.primaryColorLight,
                        Get.theme.primaryColor,
                        Get.theme.accentColor,
                      ])),
              height: double.infinity,
              width: double.infinity),
      //!-------------------Barra inferior de navegación------------------!//
      bottomNavigationBar: Row(
        children: [
          NavBarItem(iconBar: Icon(Icons.add_a_photo_rounded)),
          NavBarItem(iconBar: Icon(Icons.add_a_photo_rounded)),
          NavBarItem(iconBar: Icon(Icons.add_a_photo_rounded)),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final Icon iconBar;
  final bool isActived;

  const NavBarItem({
    Key key,
    this.iconBar,
    this.isActived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: Get.width / 3,
      decoration: BoxDecoration(color: Get.theme.primaryColorLight),
      child: FlatButton(
        onPressed: () {},
        child: iconBar,
      ),
    );
  }
}

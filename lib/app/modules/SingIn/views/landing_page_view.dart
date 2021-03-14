import 'package:finanzas_personales/app/modules/SingIn/controllers/sing_in_controller.dart';
import 'package:finanzas_personales/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LandingPageView extends GetView<SingInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        //initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Get.theme.primaryColorLight,
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final autentificado = await controller.isLoggedId();
    if (autentificado) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.SING_IN);
    }
  }
}

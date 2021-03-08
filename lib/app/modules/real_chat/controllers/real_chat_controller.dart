import 'package:finanzas_personales/app/modules/real_chat/models/user_reaalTime.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:finanzas_personales/app/modules/real_chat/views/chat_message_view.dart';
import 'package:vibration/vibration.dart';

class RealChatController extends GetxController {
  RxString chatText = ''.obs;
  RxBool writing = false.obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final textEditingController = TextEditingController();
  final focusNode = FocusNode();

  final usuariosRealTimeList = [
    UserRealTime(email: '@1', nombre: 'Danny1', uid: '1', onlineBool: true),
    UserRealTime(email: '@1', nombre: 'Danny1', uid: '1', onlineBool: true),
    UserRealTime(email: '@2', nombre: 'Danny2', uid: '2', onlineBool: true),
    UserRealTime(email: '@2', nombre: 'Danny2', uid: '2', onlineBool: true),
    UserRealTime(email: '@2', nombre: 'Danny2', uid: '2', onlineBool: true),
    UserRealTime(email: '@2', nombre: 'Danny2', uid: '2', onlineBool: true),
    UserRealTime(email: '@2', nombre: 'Danny2', uid: '2', onlineBool: true),
    UserRealTime(email: '@3', nombre: 'Danny3', uid: '3', onlineBool: false),
    UserRealTime(email: '@4', nombre: 'Danny4', uid: '4', onlineBool: true),
    UserRealTime(email: '@3', nombre: 'Danny3', uid: '3', onlineBool: false),
    UserRealTime(email: '@3', nombre: 'ol', uid: '3', onlineBool: false),
  ].obs;

  List<ChatMessageView> message = [
    ChatMessageView(
      uid: '123',
      textChat:
          'Hola mundo46546546646456645654654654894798dfgedfiubnerinuferinuf',
    ),
    ChatMessageView(
      uid: '124',
      textChat: 'Hola mundo2',
    ),
    ChatMessageView(
      uid: '123',
      textChat: 'Hola mundo3',
    ),
  ].obs;

  //!-------------------Refresh------------------!//
  loadingUserRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  //!-------------------Summit------------------!//
  handleSumit(String texto) async {
    final newMessage = ChatMessageView(
      uid: '123',
      textChat: texto,
    );
    print(texto);
    message.insert(0, newMessage);
    textEditingController.clear();
    focusNode.requestFocus();
    writing.value = false;
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }
}

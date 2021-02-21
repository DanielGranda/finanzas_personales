import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketController extends GetxController {
  IO.Socket _socket;
  IO.Socket get socket => _socket;
  Rx<ServerStatus> _status = ServerStatus.Connecting.obs;
  Rx<ServerStatus> get status => _status;

  //Emitir mensje
  Function get emit => _socket.emit;

  //Estado del socket
  void initConfigSocket() {
    this._socket = IO.io('http://192.168.100.168:3001', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    this._socket.on(
        'connect',
        (_) => {
              this._status.value = ServerStatus.Online,
              print('$_status' + '✅')
            });

    this._socket.on(
        'disconnect',
        (_) => {
              this._status.value = ServerStatus.Offline,
              print('$_status' + '⚠️')
            });

/*     socket.on(
        'nuevo mensaje',
        (payload) => {
              print('$payload'),
              print(payload['nombre']),
              print(payload['mensaje']),
            }); */
  }
}

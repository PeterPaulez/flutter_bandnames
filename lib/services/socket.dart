import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket =>
      this._socket; // Para escuchar y poder terminar con un OFF
  Function get emitir => this._socket.emit; // Sino queremos hacer un OFF

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    this._socket = IO.io('http://192.168.1.33:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true
    });

    this._socket.on('connect', (_) {
      print('Connected');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('Disconnected');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // Mejor no poner tipado al PAYLOAD
    this._socket.on('nuevo-mensaje', (payload) {
      String nombre =
          (payload.containsKey('nombre')) ? payload['nombre'] : 'Sin nombre';
      print('nuevo-mensaje: $nombre');
      notifyListeners();
    });
  }
}

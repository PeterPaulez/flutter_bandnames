import 'package:band_names/services/socket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server Status ${socketService.serverStatus}'),
            //Text('Server Status ${socketService.socket.on('sent-mensaje','HEY')}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.emitir('sent-mensaje', {
            'nombre': 'FLutter',
            'mensaje': 'Hola Mundo!',
          });
        },
        child: Icon(Icons.message),
      ),
    );
  }
}

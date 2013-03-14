library server;

import 'dart:io';
import "package:stream/stream.dart";

void main() {
  var port = Platform.environment.containsKey('PORT') ? int.parse(Platform.environment['PORT']) : 8080;
  var host = '0.0.0.0';
  var streamServer = new StreamServer();
  streamServer
  ..port = port
  ..host = host
  ..start();
}
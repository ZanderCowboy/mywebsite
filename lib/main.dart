import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/views/app.dart';

Future<void> main() async {
  await bootstrap();

  runApp(const App());
}

import 'package:flutter/material.dart';
import 'package:yoko_test_task/app/app.dart';
import 'package:provider/provider.dart';
import 'package:yoko_test_task/ui/pages/activies/activities.controller.dart';
import 'package:yoko_test_task/ui/pages/auth/auth.controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthController()),
      ChangeNotifierProvider(create: (context) => ActivitiesController()),
    ],
    child: const App(),
  ));
}

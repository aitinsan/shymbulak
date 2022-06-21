import 'package:flutter/material.dart';
import 'package:yoko_test_task/ui/pages/auth/auth.page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Yoko Test',
      home: AuthPage(),
    );
  }
}

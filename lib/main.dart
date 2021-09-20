import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:office_collab/Screens/Login/login.dart';
import 'Screens/Admin/admin_panel.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'admin_panel': (context) => const AdminPanel(),
      },
      home: const SwitchLogin(),
    );
  }
}

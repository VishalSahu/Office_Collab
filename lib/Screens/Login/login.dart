import 'package:flutter/material.dart';
import 'package:office_collab/Screens/Login/adminlogin.dart';
import 'package:office_collab/Screens/Login/employeelogin.dart';

class SwitchLogin extends StatelessWidget {
  const SwitchLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Panel'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminLogin()));}, child: const Text('Admin Login'),),
                ElevatedButton(onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>EmpLogin()));}, child: const Text('Employee Login'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

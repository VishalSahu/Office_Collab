import 'package:flutter/material.dart';
import 'package:office_collab/Screens/Admin/add_employee.dart';
import 'package:office_collab/Screens/Admin/list_delete_employee.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddEmployee()));
                },
                child: const Text('Add Employees'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateEmployee()));
                },
                child: const Text('Update/Delete Employees Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

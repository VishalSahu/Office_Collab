import 'package:flutter/material.dart';
import 'package:office_collab/Screens/Employee/search_emp.dart';
import 'package:office_collab/Screens/Employee/upperlevelview.dart';
import 'package:office_collab/Screens/Employee/view_profie.dart';

class EmployeePanel extends StatelessWidget {
  const EmployeePanel({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Page'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmpDetail(id: id),
                  ),
                );
              },
              child: const Text('Personal Details'),
            ),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchEmp(),
                  ),
                );
              },
              child: const Text('Search Employees'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpperLevelView(id: id),
                  ),
                );
              },
              child: const Text('CTO / CEO / Reporting Manager'),
            ),
          ],
        ),
      ),
    );
  }
}

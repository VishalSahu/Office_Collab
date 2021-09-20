import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpperLevelView extends StatefulWidget {
  const UpperLevelView({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  _UpperLevelViewState createState() => _UpperLevelViewState();
}

class _UpperLevelViewState extends State<UpperLevelView> {
  CollectionReference emp =
      FirebaseFirestore.instance.collection('employee_details');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Employee Details'),
      ),
      body: Center(
        child: Form(
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('employee_details')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var project_allocated = data!['project_allocated'];
              var reporting_manager = data['reporting_manager'];

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: reporting_manager,
                        onChanged: (value) => reporting_manager = value,
                        decoration: const InputDecoration(
                          labelText: 'Reporting Manager',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: project_allocated,
                        onChanged: (value) => project_allocated = value,
                        decoration: const InputDecoration(
                          labelText: 'Allocated Project',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

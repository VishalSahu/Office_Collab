import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditEmp extends StatefulWidget {
  const EditEmp({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  _EditEmpState createState() => _EditEmpState();
}

class _EditEmpState extends State<EditEmp> {
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
              var name = data!['name'];
              var email = data['email'];
              var password = data['password'];
              var address = data['address'];
              var skills = data['skills'];
              var phoneNumber = data['phoneNumber'];
              var designation = data['designation'];
              var band = data['band'];
              var project_allocated = data['project_allocated'];
              var reporting_manager = data['reporting_manager'];

              var chosenValue = data['band'];
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: email,
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: password,
                        onChanged: (value) => password = value,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: address,
                        onChanged: (value) => address = value,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: skills,
                        enabled: false,
                        onChanged: (value) => skills = value,
                        decoration: const InputDecoration(
                          labelText: 'Skills',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: phoneNumber,
                        enabled: false,
                        onChanged: (value) => phoneNumber = value,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: designation,
                        onChanged: (value) => designation = value,
                        decoration: const InputDecoration(
                          labelText: 'Designation',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: band,
                        onChanged: (value) => band = value,
                        decoration: const InputDecoration(
                          labelText: 'Band',
                          border: OutlineInputBorder(),
                        ),
                      ),
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
                      ElevatedButton(
                          onPressed: () async => await emp
                              .doc(widget.id)
                              .update({'password': password,'address':address,'designation':designation,'band':band,'project_allocated':project_allocated,'reporting_manager':reporting_manager})
                              .catchError((error) => print("Failed to update user: $error"),),
                          child: const Text('Update'),),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:office_collab/Screens/Employee/employee_panel.dart';

class EmpLogin extends StatefulWidget {
  EmpLogin({Key? key}) : super(key: key);

  @override
  State<EmpLogin> createState() => _EmpLoginState();
}

class _EmpLoginState extends State<EmpLogin> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final Stream<QuerySnapshot> employeeStream =
      FirebaseFirestore.instance.collection('employee_details').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: employeeStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final List employeesList = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          employeesList.add(a);
          a['id'] = document.id;
        }).toList();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Employee'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,

                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: (){

                  for (var i = 0; i < employeesList.length; i++)
                    {
                      if(employeesList[i]['email']==emailController!.text && employeesList[i]['password']==passwordController!.text)
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EmployeePanel(id:employeesList[i]['id']),
                            ),
                          );
                        }
                    }
                }, child: const Text('Login'),),
              ],
            ),
          ),
        );
      },
    );
  }
}

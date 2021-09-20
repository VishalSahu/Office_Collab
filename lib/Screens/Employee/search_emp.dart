import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:office_collab/Screens/Employee/employee_panel.dart';

class SearchEmp extends StatefulWidget {
  SearchEmp({Key? key}) : super(key: key);

  @override
  State<SearchEmp> createState() => _SearchEmpState();
}

class _SearchEmpState extends State<SearchEmp> {
  final Stream<QuerySnapshot> employeeStream =
      FirebaseFirestore.instance.collection('employee_details').snapshots();
  TextEditingController? searchController = TextEditingController();
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
            title: const Text('All Employees Detail'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    1: FixedColumnWidth(160),

                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    const TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(
                                'Designation',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(
                            'Project',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    for (var i = 0; i < employeesList.length; i++) ...[
                      TableRow(
                        children: [
                          TableCell(
                            child: Text(
                              employeesList[i]['name'],
                            ),
                          ),
                          TableCell(
                            child: Text(
                              employeesList[i]['email'],
                            ),
                          ),
                          TableCell(
                            child: Text(
                              employeesList[i]['designation'],
                            ),
                          ),
                          TableCell(
                            child: Text(
                              employeesList[i]['project_allocated'],
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//Scaffold(
//           appBar: AppBar(
//             title: const Text('Search Employee'),
//           ),
//           body: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: searchController,
//                     decoration: const InputDecoration(
//                       labelText: 'Search Employee',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       for (var i = 0; i < employeesList.length; i++) {
//                         if (employeesList[i]['name'] == searchController!.text) {
//                           print(employeesList[i]['email']);
//                         }
//                       }
//                     },
//                     child: const Text('Search'),
//                   ),
//                   ListView(
//                     children: [
//
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );

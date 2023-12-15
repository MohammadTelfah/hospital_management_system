// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'model/navbar.dart';
// import 'model/patient.dart';
// import 'patient_detail_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   static const routeName = '/HomeScreen';
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Patient>? patientsList;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//          bottomNavigationBar: const BottomNavigationBarWidget(
//           currentIndex: 0,
//         ),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 215, 193, 242),
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: const Text(
//             'All Patients',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: FutureBuilder<List<Patient>>(
//           future: fetchPatients(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return const Center(child: Text('Error fetching patients'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No patients found'));
//             } else if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   Patient patient = snapshot.data![index];
//                   String imagePath = patient.gender == 'Male'
//                       ? 'assets/images/male_pic.png'
//                       : 'assets/images/female_pic.png';

//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Image.asset(
//                                 imagePath,
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                               Container(width: 20),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Container(height: 5),
//                                     Text(
//                                       patient.fullName,
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey[800],
//                                       ),
//                                     ),
//                                     Container(height: 5),
//                                     Text(
//                                       'Age: ${patient.age}\nGender: ${patient.gender}',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.grey[500],
//                                       ),
//                                     ),
//                                     Container(height: 10),
//                                     Text(
//                                       'Contact: ${patient.phoneNumber}',
//                                       maxLines: 2,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey[700],
//                                       ),
//                                     ),
//                                     ButtonBar(
//                                       alignment: MainAxisAlignment.spaceBetween,
//                                       buttonPadding: const EdgeInsets.all(
//                                           0), // Adjust padding if necessary
//                                       children: <Widget>[
//                                         Chip(
//                                           label: Text(
//                                             patient.status == 'Emergency'
//                                                 ? 'Emergency Case'
//                                                 : 'Non-Emergency',
//                                             style: const TextStyle(
//                                                 color: Colors.white),
//                                           ),
//                                           backgroundColor:
//                                               patient.status == 'Emergency'
//                                                   ? Colors.redAccent
//                                                   : const Color.fromARGB(
//                                                       255, 145, 182, 147),
//                                         ),
//                                         TextButton(
//                                           onPressed: () async {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     PatientDetailScreen(
//                                                         patient: patient),
//                                               ),
//                                             );
//                                           },
//                                           child: const Text('Details'),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Text('No Patients Found');
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future<List<Patient>> fetchPatients() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('patients').get();
//     return querySnapshot.docs.map((doc) => Patient.fromFirestore(doc)).toList();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model/navbar.dart';
import 'model/patient.dart';
import 'patient_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<int> getPatientCount() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('patients').get();
    return querySnapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(
          currentIndex: 0,
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 215, 193, 242),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: FutureBuilder(
            future: getPatientCount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('All Patients');
              } else if (snapshot.hasError || snapshot.data == null) {
                return const Text('All Patients');
              } else {
                int? patientCount = snapshot.data;
                return Text(
                  'All Patients : ${patientCount ?? 0}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            },
          ),
        ),
        body: FutureBuilder<List<Patient>>(
          future: fetchPatients(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching patients'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No patients found'));
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Patient patient = snapshot.data![index];
                        String imagePath = patient.gender == 'Male'
                            ? 'assets/images/male_pic.png'
                            : 'assets/images/female_pic.png';

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      imagePath,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(height: 5),
                                          Text(
                                            patient.fullName,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          Container(height: 5),
                                          Text(
                                            'Age: ${patient.age}\nGender: ${patient.gender}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          Container(height: 10),
                                          Text(
                                            'Contact: ${patient.phoneNumber}',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          ButtonBar(
                                            alignment:
                                                MainAxisAlignment.spaceBetween,
                                            buttonPadding:
                                                const EdgeInsets.all(0),
                                            children: <Widget>[
                                              Chip(
                                                label: Text(
                                                  patient.status == 'Emergency'
                                                      ? 'Emergency Case'
                                                      : 'Non-Emergency',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    patient.status ==
                                                            'Emergency'
                                                        ? Colors.redAccent
                                                        : const Color.fromARGB(
                                                            255, 145, 182, 147),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PatientDetailScreen(
                                                              patient: patient),
                                                    ),
                                                  );
                                                },
                                                child: const Text('Details'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Text('No Patients Found');
            }
          },
        ),
      ),
    );
  }

  Future<List<Patient>> fetchPatients() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('patients').get();
    return querySnapshot.docs.map((doc) => Patient.fromFirestore(doc)).toList();
  }
}

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  String id;
  String patientID;
  String fullName;
  int? age;
  String? gender;
  int? phoneNumber;
  String? email;
  String? allergies;
  String? currentMedications;
  String? medicalHistory;
  String? diagnosis;
  String? treatmentPlan;
  String? status;
  String? diagnosisNote;
  bool detailsButtonDisabled;
  Patient({
    required this.id,
    required this.patientID,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.allergies,
    required this.currentMedications,
    required this.medicalHistory,
    required this.diagnosis,
    required this.treatmentPlan,
    required this.status,
    required this.diagnosisNote,
    required this.detailsButtonDisabled,
  });
  factory Patient.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Patient(
      id: doc.id,
      patientID: data['patientID'] ?? '',
      fullName: data['fullName'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      phoneNumber: data['phoneNumber'] ?? 0,
      email: data['email'] ?? '',
      allergies: data['allergies'] ?? '',
      currentMedications: data['currentMedications'] ?? '',
      medicalHistory: data['medicalHistory'] ?? '',
      diagnosis: data['diagnosis'] ?? '',
      treatmentPlan: data['treatmentPlan'] ?? '',
      status: data['status'] ?? '',
      diagnosisNote: data['diagnosisNote'] ?? '',
      detailsButtonDisabled: false,
    );
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/patient.dart';

class PatientDetailScreen extends StatefulWidget {
  final Patient patient;

  PatientDetailScreen({
    required this.patient,
  });

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _noteController.text = widget.patient.diagnosis!;
  }

  void _updateDiagnosis(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String newDiagnosis = _noteController.text;
      FirebaseFirestore.instance
          .collection('patients')
          .doc(widget.patient.id)
          .update({
        'diagnosis': newDiagnosis,
      }).then((_) {
        setState(() {
          widget.patient.diagnosis =
              newDiagnosis; // Update the diagnosis in the patient object
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Diagnosis updated')));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update diagnosis')));
      });
      _noteController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Full Name'),
                        subtitle: Text(widget.patient.fullName),
                      ),
                      ListTile(
                        title: const Text('Patient ID'),
                        subtitle: Text('${widget.patient.patientID}'),
                      ),
                      ListTile(
                        title: const Text('Age'),
                        subtitle: Text('${widget.patient.age}'),
                      ),
                      ListTile(
                        title: const Text('Gender'),
                        subtitle: Text('${widget.patient.gender}'),
                      ),
                      ListTile(
                        title: const Text('Contact Phone'),
                        subtitle: Text('${widget.patient.phoneNumber}'),
                      ),
                      ListTile(
                        title: const Text('Contact Email'),
                        subtitle: Text('${widget.patient.email}'),
                      ),
                      ListTile(
                        title: const Text('Medical History'),
                        subtitle: Text('${widget.patient.medicalHistory}'),
                      ),
                      ListTile(
                        title: const Text('Allergies'),
                        subtitle: Text('${widget.patient.allergies}'),
                      ),
                      ListTile(
                        title: const Text('Current Medications'),
                        subtitle: Text('${widget.patient.currentMedications}'),
                      ),
                      ListTile(
                        title: const Text('Diagnosis'),
                        subtitle: Text('${widget.patient.diagnosis}'),
                      ),
                      ListTile(
                        title: const Text('Treatment Plan'),
                        subtitle: Text('${widget.patient.treatmentPlan}'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _noteController,
                  decoration: const InputDecoration(
                    labelText: 'Diagnosis or Additional Note',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a note';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _updateDiagnosis(context);
                  },
                  child: const Text('Submit Diagnosis'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

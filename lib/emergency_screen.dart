// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/navbar.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 1,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 215, 193, 242),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Emergency Screen',style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'In case of emergency, please use the following options to contact a doctor or send a report:',
              style: TextStyle(fontSize: 20,),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchEmail('emergency@example.com', 'Emergency Report', 'Dear Doctor,\n\nPlease find attached an emergency report.');
              },
              child: const Text('Send Emergency Email'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _makePhoneCall('+123456789');
              },
              child: const Text('Call Emergency Number'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail(String email, String subject, String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    final String emailLaunchUriString = emailLaunchUri.toString();
    await launch(emailLaunchUriString);
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneCallUri = Uri(scheme: 'tel', path: phoneNumber);
    final String phoneCallUriString = phoneCallUri.toString();
    await launch(phoneCallUriString);
  }
}

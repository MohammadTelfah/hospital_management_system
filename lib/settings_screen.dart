// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/feedback_screen.dart';
import 'package:hospital_management_system/terms_and_policy.dart';

import 'login_screen.dart';
import 'model/navbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 2,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 215, 193, 242),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Divider(
              thickness: 1.0,
              height: 1.0,
              color: Colors.grey[400],
            ),
            ListTile(
              title: const Text('Terms and Policy'),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndPolicy(),
                  ),
                );
              },
            ),
            Divider(
              thickness: 1.0,
              height: 1.0,
              color: Colors.grey[400],
            ),
            ListTile(
              title: const Text('Send Feedback'),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Sign out logic using FirebaseAuth
                      try {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } catch (e) {
                        print('Error signing out: $e');
                      }
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

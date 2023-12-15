import 'package:flutter/material.dart';
import 'settings_screen.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 215, 193, 242),
        title: const Text(
          'Terms And Policy',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SettingsScreen(),
              ),
            );
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms and Conditions",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'By accessing or using Doctor App, you agree to comply with and be bound by the following terms and conditions of use. If you do not agree with these terms, please do not use our application.'),
              SizedBox(
                height: 10,
              ),
              Text(
                "1.Application Use",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('1.1 User Eligibility'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'You must be a licensed medical professional to use Doctor App. By using the application, you confirm that you are a qualified doctor.'),
              SizedBox(
                height: 10,
              ),
              Text('1.2 Patient Data'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Doctor App allows doctors to access and manage patient data provided by nurses. You agree to handle this information responsibly and in compliance with applicable privacy laws.'),
              SizedBox(
                height: 10,
              ),
              Text('1.3 Diagnosis Records'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Doctors using Doctor App can create and upload diagnosis records to Firebase. You are responsible for the accuracy and confidentiality of the information you upload.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. Data Security and Privacy',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('2.1 Security Measures'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'We implement reasonable security measures to protect data on Doctor App. However, we cannot guarantee the absolute security of your data.'),
              SizedBox(
                height: 10,
              ),
              Text('2.2 Privacy Policy'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Our Privacy Policy outlines how we collect, use, and disclose personal information. By using Doctor App, you agree to the terms outlined in our Privacy Policy.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '3. Application Changes',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('3.1 Updates'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'We may update Doctor App from time to time to introduce new features or enhance existing ones. You agree to use the latest version of the application.'),
              SizedBox(
                height: 10,
              ),
              Text('3.2 Termination'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'We reserve the right to terminate or suspend your access to Doctor App at our discretion, without notice, for any reason, including violation of these terms.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '4. Limitation of Liability',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Doctor App and its creators are not liable for any indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of the application.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '5. Governing Law',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'These terms and conditions are governed by and construed in accordance with the laws of JORDAN.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '6. Contact Information',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'If you have any questions or concerns regarding these terms and conditions, please contact us at hospitalmasystem@gmail.com.'),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

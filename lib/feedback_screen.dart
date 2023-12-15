// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  final TextEditingController _feedbackController = TextEditingController();

  FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 215, 193, 242),
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'We value your feedback!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please let us know how we can improve.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Your Feedback',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String feedback = _feedbackController.text;
                print('Feedback submitted: $feedback');
              },
              child: const Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IsolateScreen extends StatelessWidget {
  const IsolateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Isolate Screen!'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the main app
                Navigator.pop(context);
              },
              child: const Text('Back to Main App'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:isolate';

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
            Image.asset(
              'assets/gifts/bouncing-ball.gif',
            ),
            // Blocking UI task
            ElevatedButton(
              onPressed: () async {
                var result = await completeTask1();
                debugPrint('Task 1 completed with result: $result');
              },
              child: const Text('Task 1'),
            ),
            // Isolate
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(completeTask2, receivePort.sendPort)
                    .catchError((e) {
                  throw 'Failed to spawn isolate: $e';
                });
                receivePort.listen((message) {
                  debugPrint('Task 2 completed with result: $message');
                  receivePort.close(); // penting!
                });
              },
              child: const Text('Task 2'),
            ),
            // Another Isolate
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(completeTask3, receivePort.sendPort)
                    .catchError((e) {
                  throw 'Failed to spawn isolate: $e';
                });
                receivePort.listen((message) {
                  debugPrint('Task 3 completed with result: $message');
                  receivePort.close(); // penting!
                });
              },
              child: const Text('Task 3'),
            ),
          ],
        ),
      ),
    );
  }

  Future<double> completeTask1() async {
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }
}

completeTask2(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}

completeTask3(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total -= i;
  }
  sendPort.send(total);
}

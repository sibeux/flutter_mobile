import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainToastOneApp extends StatefulWidget {
  const MainToastOneApp({super.key});

  @override
  State<MainToastOneApp> createState() => _MainToastOneAppState();
}

class _MainToastOneAppState extends State<MainToastOneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toast Notification',
      builder: FToastBuilder(),
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Notification'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'This is a toast notification',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 12.0,
                );
              },
              child: const Text('Show Toast'),
            ),
          ],
        ),
      ),
    );
  }
}

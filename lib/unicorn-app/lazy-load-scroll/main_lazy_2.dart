import 'dart:math';

import 'package:flutter/material.dart';

class MainLazyTwoApp extends StatelessWidget {
  const MainLazyTwoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lazy Load Demo',
      home: MyHomePage(title: 'Lazy Load Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  bool isloading = false;
  List<String> data = [
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
  ];

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent) {
        setState(() {
          isloading = true;
        });
        fetchdata();
      }
    });
    super.initState();
  }

  Future<void> fetchdata() async {
    await Future.delayed(const Duration(seconds: 2), (() {
      setState(() {
        data.addAll(List.generate(
            10, (index) => 'New data - $randomnumber')); // New Data
        isloading = false;
      });
    }));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String get randomnumber => Random().nextInt(1000).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lazy Loading App',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 47, 92, 253),
        ),
        body: ListView.builder(
          controller: controller,
          itemCount: isloading ? data.length + 1 : data.length,
          itemBuilder: (context, index) {
            if (data.length == index) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 47, 92, 253),
                    strokeWidth: 5,
                  ),
                ),
              );
            }
            return ListTile(
              title: Text(data[index]),
            );
          },
        ));
  }
}

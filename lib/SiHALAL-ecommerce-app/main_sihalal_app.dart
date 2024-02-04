import 'package:flutter/material.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/screens/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MainSihalalApp extends StatelessWidget {
  const MainSihalalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const DashboardScreen(),
    );
  }
}

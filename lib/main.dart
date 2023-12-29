import 'package:castapp/homepage.dart';
import 'package:castapp/landing_page.dart';
import 'package:castapp/prayer_provider.dart';
import 'package:castapp/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PrayerProvider(),

        ),
        ChangeNotifierProvider(
          create: (context) => TypeProvider(),

        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
      home: LandingPage(),
    );
  }
}

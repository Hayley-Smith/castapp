import 'package:castapp/authentication/authentication.dart';
import 'package:castapp/homepage.dart';
import 'package:castapp/landing_page.dart';
import 'package:castapp/prayer_provider.dart';
import 'package:castapp/type_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  DefaultFirebaseOptions.currentPlatform);
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

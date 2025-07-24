import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes.dart';

void main() {
  runApp(const VotingApp());
}

class VotingApp extends StatelessWidget {
  const VotingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Voting System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent, brightness: Brightness.dark),
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/voting_screen.dart';
import 'screens/result_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/dashboard': (context) => const DashboardScreen(),
  '/vote': (context) => const VotingScreen(),
  '/results': (context) => const ResultScreen(),
};
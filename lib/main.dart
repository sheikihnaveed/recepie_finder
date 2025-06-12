import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recipe_finder/utilities/themes/theme.dart';
import 'package:recipe_finder/views/homeScreen.dart';
import 'controller/IsarService.dart';
import 'controller/shared_prefs.dart';
import 'navigation_menu.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService().db;
  await Firebase.initializeApp();


  final isLoggedIn = await SharedPrefs.getLoginState();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AAppTheme.lightTheme,
      home: isLoggedIn ? const NavigationMenu() : const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool showLogin = true;

  void _toggleAuthMode() {
    setState(() => showLogin = !showLogin);
  }

  void _onAuthSuccess() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>  const NavigationMenu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginScreen(
      onRegisterPressed: _toggleAuthMode,
      onLoginSuccess: _onAuthSuccess,
    )
        : RegisterScreen(
      onLoginPressed: _toggleAuthMode,
      onRegisterSuccess: _onAuthSuccess,
    );
  }
}
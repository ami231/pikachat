import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pikachat/features/auth/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => context.beamToNamed(LoginPage.routeName),
              child: const Icon(Icons.arrow_back),
            ),
            const Text('register'),
          ],
        ),
      ),
    );
  }
}
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pikachat/features/auth/presentation/pages/register_page.dart';

import '../../domain/notifiers/auth_notifier.dart';

class LoginPage extends ConsumerWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'password'),
          ),
          TextButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
            },
            child: const Text('login'),
          ),
          TextButton(
            onPressed: () => Beamer.of(context, root: true)
                .beamToNamed(RegisterPage.routeName),
            child: const Text('register'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/login_screen.dart';
import 'package:nes_ticket/pages/screens/main_frame_screen.dart';
import 'package:nes_ticket/states/stores/auth/auth_notifier.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void _checkLogin() {
    final user = ref.read(authProvider);

    context.pushAndRemoveUntil(
      user != null ? MainFrameScreen() : LoginScreen(),
      (route) => false,
      transition: false,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: CircularProgressIndicator.adaptive(
        constraints: BoxConstraints.expand(width: 60, height: 60),
      ),
    );
  }
}

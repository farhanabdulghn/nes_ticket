import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/splash_screen.dart';
import 'package:nes_ticket/states/stores/auth/auth_notifier.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ModalAccountSettingsSection extends ConsumerWidget {
  const ModalAccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text(
              'Pengaturan Akun',
              style: GoogleFonts.plusJakartaSans(
                color: Color(0xFF555555),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              onTap: () async {
                await ref.read(authProvider.notifier).logout();

                if (!context.mounted) return;

                Navigator.pop(context);
                context.push(SplashScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: [
                  Icon(
                    PhosphorIconsRegular.signOut,
                    size: 24,
                    color: Color(0xFF090909),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          'Log Out',
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Pastikan untuk log out agar informasi akunmu tetap terlindungi',
                          style: GoogleFonts.plusJakartaSans(
                            color: Color(0xFF71747D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    PhosphorIconsRegular.caretRight,
                    size: 16,
                    color: Color(0xFF71747D),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class TitlePage extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? subtitle;
  final double horizontalPadding;
  const TitlePage({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.horizontalPadding = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 4,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          if (onTap != null)
            TextButton.icon(
              onPressed: onTap,
              iconAlignment: IconAlignment.end,
              label: Text('Lihat Semua'),
              icon: Icon(PhosphorIconsRegular.caretRight),
            ),
        ],
      ),
    );
  }
}

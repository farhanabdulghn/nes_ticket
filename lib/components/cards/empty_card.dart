import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/gen/assets.gen.dart';

class EmptyCard extends StatelessWidget {
  final String message;
  final double? bottomSpacing;
  const EmptyCard(this.message, {super.key, this.bottomSpacing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ).copyWith(bottom: bottomSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 32,
        children: [
          Assets.images.empty.svg(width: 276, height: 200),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              color: Color(0xFF71747D),
            ),
          ),
        ],
      ),
    );
  }
}

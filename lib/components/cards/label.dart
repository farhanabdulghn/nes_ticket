import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/extensions/extensions.dart';

class Label<T> extends StatelessWidget {
  final String? label;
  final T? value;
  const Label({super.key, required this.label, required this.value});

  String _value() {
    if (value == null) return '-';

    if (value is String?) {
      final strValue = value as String?;

      return strValue ?? '';
    }

    final intValue = value as int;
    return intValue.hasNoValue ? '-' : '\$$intValue';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            label ?? '',
            style: GoogleFonts.inter(fontSize: 10, color: Color(0xFF71747D)),
          ),
          Text(
            _value(),
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

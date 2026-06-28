import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';

class MediaVerticalCard extends StatelessWidget {
  final String? path;
  final int? score;

  const MediaVerticalCard({super.key, required this.path, required this.score});

  @override
  Widget build(BuildContext context) {
    final isHigh = score != null && (score ?? 0) > 70;
    final color = isHigh ? Color(0xFFFAFAFA) : Color(0xFF1F2937);

    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            TmdbImage(path),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: 24,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isHigh ? Color(0xFF08983D) : Color(0xFFFACC15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 1,
                  children: [
                    Text(
                      score != null ? '$score' : 'NR',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: color,
                      ),
                    ),
                    if (score != null)
                      Text(
                        '%',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 8,
                          color: color,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

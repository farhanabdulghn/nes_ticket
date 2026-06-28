import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class MediaHorizontalCard extends StatelessWidget {
  final String? backdropPath;
  final int? score;
  final String? title;
  final String? overview;
  const MediaHorizontalCard({
    super.key,
    required this.backdropPath,
    required this.score,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          SizedBox(
            height: 185,
            child: Stack(
              children: [
                TmdbImage(backdropPath, width: double.infinity),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    height: 24,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFFACC15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 2,
                      children: [
                        Icon(
                          PhosphorIconsFill.star,
                          size: 12,
                          color: Color(0xFF713F12),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 1,
                          children: [
                            Text(
                              score != null ? '$score' : 'NR',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xFF713F12),
                              ),
                            ),
                            if (score != null)
                              Text(
                                '%',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 8,
                                  color: Color(0xFF713F12),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  title ?? '',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text(
                  overview ?? '',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: Color(0xFF71747D),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}

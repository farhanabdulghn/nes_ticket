import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/states/actions/movie/movie_state.dart';
import 'package:nes_ticket/states/actions/tv/tv_state.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ReviewSection extends ConsumerWidget {
  final int? id;
  final bool isTv;
  const ReviewSection({super.key, required this.id, required this.isTv});

  String _getInitials(String name) {
    if (name.trim().isEmpty) return '?';
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name.substring(0, name.length >= 2 ? 2 : 1).toUpperCase();
  }

  Color _getAvatarColor(String name) {
    final colors = [
      const Color(0xFFE53935),
      const Color(0xFFD81B60),
      const Color(0xFF8E24AA),
      const Color(0xFF3949AB),
      const Color(0xFF039BE5),
      const Color(0xFF00897B),
      const Color(0xFF43A047),
      const Color(0xFFFB8C00),
    ];
    if (name.isEmpty) return colors.first;

    final hash = name.codeUnits.fold(0, (prev, curr) => prev + curr);
    return colors[hash % colors.length];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      isTv ? getTvReviewsProvider(id) : getMovieReviewsProvider(id),
    );

    if (state.hasError || state.value.hasNoValue) return SizedBox.shrink();

    return state.maybeWhen(
      data: (datas) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Ulasan',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: datas.map((data) {
                  final authorName = data.author ?? 'Unknown';
                  final avatarPath = data.authorDetails?.avatarPath;
                  final hasAvatar = avatarPath != null && avatarPath.isNotEmpty;

                  return SizedBox(
                    width: 342,
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          spacing: 12,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 12,
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: hasAvatar
                                            ? Colors.transparent
                                            : _getAvatarColor(authorName),
                                        shape: BoxShape.circle,
                                      ),
                                      child: hasAvatar
                                          ? TmdbImage(avatarPath)
                                          : Text(
                                              _getInitials(authorName),
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                            ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 4,
                                      children: [
                                        Text(
                                          authorName,
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          data.createdAt.toIndoDate,
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 10,
                                            color: Color(0xFF71747D),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 23,
                                  padding: EdgeInsets.only(left: 6, right: 8),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFACC15),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Row(
                                    spacing: 4,
                                    children: [
                                      Icon(PhosphorIconsFill.star, size: 12),
                                      Text(
                                        '${data.authorDetails?.rating ?? ''}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              data.content ?? '',
                              style: GoogleFonts.plusJakartaSans(
                                color: Color(0xFF71747D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
      orElse: () => CircularProgressIndicator.adaptive(),
    );
  }
}

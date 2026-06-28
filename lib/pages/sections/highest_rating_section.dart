import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/app_routes.dart';
import 'package:nes_ticket/components/cards/title_page.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/stores/top_rated/top_rated_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class HighestRatingSection extends ConsumerWidget {
  const HighestRatingSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topRatedProvider(MediaType.movie));

    return state.when(
      data: (datas) {
        if (datas.isEmpty) return SizedBox.shrink();

        final bool isMoreThanFive = datas.length > 5;
        final limitedDatas = datas.take(5).toList();

        return Column(
          spacing: 12,
          children: [
            TitlePage(
              onTap: isMoreThanFive
                  ? () => Navigator.pushNamed(context, AppRoute.highestRating)
                  : null,
              title: 'Rating Tertinggi',
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8,
                children: limitedDatas.map((data) {
                  final score = data.voteAverage.toScorePercent(data.voteCount);

                  return GestureDetector(
                    onTap: () => context.push(
                      DetailScreen(
                        id: data.id,
                        isTv: data.mediaType == MediaType.tv,
                      ),
                    ),
                    child: SizedBox(
                      width: 330,
                      child: Card(
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            TmdbImage(data.backdropPath, height: 185),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  Text(
                                    data.originalTitle ??
                                        data.originalName ??
                                        '',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.releaseDate.toFormattedDate,
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Color(0xFF71747D),
                                        ),
                                      ),
                                      Row(
                                        spacing: 2,
                                        children: [
                                          Icon(
                                            PhosphorIconsFill.star,
                                            size: 12,
                                            color: Color(0xFF71747D),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            spacing: 1,
                                            children: [
                                              Text(
                                                score != null ? '$score' : 'NR',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                      color: Color(0xFF71747D),
                                                    ),
                                              ),
                                              if (score != null)
                                                Text(
                                                  '%',
                                                  style:
                                                      GoogleFonts.plusJakartaSans(
                                                        fontSize: 8,
                                                        color: Color(
                                                          0xFF71747D,
                                                        ),
                                                      ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
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
      error: (error, stackTrace) {
        return SizedBox.shrink();
      },
      loading: () => CircularProgressIndicator.adaptive(),
    );
  }
}

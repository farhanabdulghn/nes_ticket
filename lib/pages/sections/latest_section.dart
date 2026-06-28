import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/components/cards/media_vertical_card.dart';
import 'package:nes_ticket/components/cards/title_page.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/actions/movie/movie_state.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

class LatestSection extends ConsumerWidget {
  const LatestSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getMovieNowPlayingProvider);

    return state.when(
      data: (datas) {
        if (datas.isEmpty) return SizedBox.shrink();

        return Column(
          spacing: 12,
          children: [
            TitlePage(
              title: 'Baru Rilis',
              subtitle: DateTime.now().month.toMonthName(),
            ),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                spacing: 8,
                children: datas.map((data) {
                  final score = data.voteAverage.toScorePercent(data.voteCount);

                  return GestureDetector(
                    onTap: () => context.push(
                      DetailScreen(
                        id: data.id,
                        isTv: data.mediaType == MediaType.tv,
                      ),
                    ),
                    child: SizedBox(
                      width: 160,
                      child: MediaVerticalCard(
                        path: data.posterPath,
                        score: score,
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

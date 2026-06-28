import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/app_routes.dart';
import 'package:nes_ticket/components/cards/title_page.dart';
import 'package:nes_ticket/components/cards/media_horizontal_card.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/actions/trending/trending_state.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

class TrendingTodaySection extends ConsumerWidget {
  const TrendingTodaySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getTrendingDayProvider(ContentType.all));

    return state.when(
      data: (datas) {
        if (datas.isEmpty) return SizedBox.shrink();

        final bool isMoreThanFive = datas.length > 5;
        final limitedDatas = datas.take(5).toList();

        return Column(
          spacing: 16,
          children: [
            SizedBox(),
            TitlePage(
              onTap: isMoreThanFive
                  ? () => Navigator.pushNamed(context, AppRoute.trendingToday)
                  : null,
              horizontalPadding: 16,
              title: 'Trending',
              subtitle: 'Hari ini',
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: MediaHorizontalCard(
                        backdropPath: data.backdropPath,
                        score: score,
                        title: data.displayTitle,
                        overview: data.overview,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(),
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

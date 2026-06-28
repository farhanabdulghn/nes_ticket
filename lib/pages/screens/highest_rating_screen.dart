import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/empty_card.dart';
import 'package:nes_ticket/components/cards/media_horizontal_card.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/stores/top_rated/top_rated_notifier.dart';
import 'package:nes_ticket/utils/app_route_annotation.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

@AutoRoute()
class HighestRatingScreen extends ConsumerStatefulWidget {
  const HighestRatingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HighestRatingScreenState();
}

class _HighestRatingScreenState extends ConsumerState<HighestRatingScreen> {
  MediaType _selected = MediaType.movie;

  Widget _buildFilterChip(String label, MediaType type) {
    final isSelected = _selected == type;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) setState(() => _selected = type);
      },
      showCheckmark: false,
      labelStyle: GoogleFonts.plusJakartaSans(
        color: isSelected ? Colors.white : const Color(0xFF3F55C6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = topRatedProvider(_selected);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Tertinggi'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              spacing: 8,
              children: [
                _buildFilterChip('Film', MediaType.movie),
                _buildFilterChip('Serial TV', MediaType.tv),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => ref.refresh(provider.future),
        child: state.when(
          data: (datas) {
            if (datas.isEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: EmptyCard(
                      'Rating tertinggi masih kosong nih',
                      bottomSpacing: MediaQuery.of(context).padding.top,
                    ),
                  ),
                ],
              );
            }

            final hasMore = ref.read(provider.notifier).hasMore;

            return ListView.builder(
              padding: EdgeInsets.all(24),
              itemCount: datas.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= datas.length - 3 &&
                    !ref.read(provider.notifier).isFetchingMore) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(provider.notifier).fetchMore();
                  });
                }

                if (index == datas.length) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                }

                final item = datas[index];
                final score = item.voteAverage.toScorePercent(item.voteCount);

                return Padding(
                  key: ValueKey(item.id),
                  padding: EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => context.push(
                      DetailScreen(
                        id: item.id,
                        isTv: item.mediaType == MediaType.tv,
                      ),
                    ),
                    child: MediaHorizontalCard(
                      backdropPath: item.backdropPath,
                      score: score,
                      title: item.displayTitle,
                      overview: item.overview,
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) =>
              Center(child: Text('Terjadi kesalahan: $error')),
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}

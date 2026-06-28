import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/empty_card.dart';
import 'package:nes_ticket/components/cards/media_horizontal_card.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/actions/trending/trending_state.dart';
import 'package:nes_ticket/utils/app_route_annotation.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

@AutoRoute()
class TrendingTodayScreen extends ConsumerStatefulWidget {
  const TrendingTodayScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TrendingTodayScreenState();
}

class _TrendingTodayScreenState extends ConsumerState<TrendingTodayScreen> {
  ContentType _selectedCategory = ContentType.all;

  Widget _buildFilterChip(String label, ContentType category) {
    final isSelected = _selectedCategory == category;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) setState(() => _selectedCategory = category);
      },
      showCheckmark: false,
      labelStyle: GoogleFonts.plusJakartaSans(
        color: isSelected ? Colors.white : Color(0xFF3F55C6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = getTrendingDayProvider(_selectedCategory);

    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Hari Ini'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              spacing: 8,
              children: [
                _buildFilterChip('Semua', ContentType.all),
                _buildFilterChip('Film', ContentType.movie),
                _buildFilterChip('Serial TV', ContentType.tv),
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
                      'Trending hari ini masih kosong nih',
                      bottomSpacing: MediaQuery.of(context).padding.top,
                    ),
                  ),
                ],
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(24),
              itemCount: datas.length,
              itemBuilder: (context, index) {
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

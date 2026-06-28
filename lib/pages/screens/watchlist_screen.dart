import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/empty_card.dart';
import 'package:nes_ticket/components/cards/media_horizontal_card.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/stores/watchlist/watchlist_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

class WatchlistScreen extends ConsumerStatefulWidget {
  const WatchlistScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WatchlistScreenState();
}

class _WatchlistScreenState extends ConsumerState<WatchlistScreen> {
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
    final rawWatchlist = ref.watch(watchlistProvider);

    final watchlist = rawWatchlist.where((item) {
      if (_selectedCategory == ContentType.movie) {
        return item.mediaType == MediaType.movie;
      } else if (_selectedCategory == ContentType.tv) {
        return item.mediaType == MediaType.tv;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(spacing: 4, children: [Text('👀'), Text('Watchlist')]),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 24, top: 15.5, bottom: 24),
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            sliver: watchlist.isNotEmpty
                ? SliverList.builder(
                    itemCount: watchlist.length,
                    itemBuilder: (context, index) {
                      final item = watchlist[index];

                      final score = item.voteAverage.toScorePercent(
                        item.voteCount,
                      );

                      return Padding(
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
                  )
                : SliverFillRemaining(
                    child: EmptyCard(
                      'Watchlistmu masih kosong. Yuk, tambahkan yang ingin kamu tonton!',
                      bottomSpacing: MediaQuery.of(context).padding.top,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/components/cards/empty_card.dart';
import 'package:nes_ticket/components/cards/media_horizontal_card.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/key_label/key_label_model.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/states/stores/discover/discover_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

class MediaByGenreScreen extends ConsumerStatefulWidget {
  final KeyLabelModel? genre;
  final bool isTv;
  const MediaByGenreScreen({
    super.key,
    required this.genre,
    required this.isTv,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MediaByGenreScreenState();
}

class _MediaByGenreScreenState extends ConsumerState<MediaByGenreScreen> {
  late MediaType _mediaType;

  @override
  void initState() {
    super.initState();
    _mediaType = widget.isTv ? MediaType.tv : MediaType.movie;
  }

  @override
  Widget build(BuildContext context) {
    final genre = widget.genre;
    final id = genre?.id;
    final provider = discoverProvider(genreId: id, type: _mediaType);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(title: Text(genre?.name ?? '')),
      body: RefreshIndicator.adaptive(
        onRefresh: () => ref.refresh(provider.future),
        child: state.when(
          data: (datas) {
            if (datas.isEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: EmptyCard(
                      'Tidak ada data nih di genre ${genre?.name} nih. Coba cari genre lain ya',
                      bottomSpacing: MediaQuery.of(context).padding.top,
                    ),
                  ),
                ],
              );
            }

            final hasMore = ref.read(provider.notifier).hasMore;

            return ListView.builder(
              itemCount: datas.length + (hasMore ? 1 : 0),
              padding: EdgeInsets.all(24),
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

                final data = datas[index];
                final score = data.voteAverage.toScorePercent(data.voteCount);

                return Padding(
                  key: ValueKey(data.id),
                  padding: EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => context.push(
                      DetailScreen(
                        id: data.id,
                        isTv: data.mediaType == MediaType.tv,
                      ),
                    ),
                    child: MediaHorizontalCard(
                      backdropPath: data.backdropPath,
                      score: score,
                      title: data.displayTitle,
                      overview: data.overview,
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text('Terjadi kesalahan'));
          },
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}

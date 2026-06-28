import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/label.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/sections/credit_grid_section.dart';
import 'package:nes_ticket/pages/sections/credit_section.dart';
import 'package:nes_ticket/pages/sections/review_section.dart';
import 'package:nes_ticket/states/actions/movie/movie_state.dart';
import 'package:nes_ticket/states/actions/tv/tv_state.dart';
import 'package:nes_ticket/states/stores/recent/recent_notifier.dart';
import 'package:nes_ticket/states/stores/watchlist/watchlist_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

Widget _container({required double spacing, required List<Widget> children}) {
  return Container(
    padding: EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing,
      children: children,
    ),
  );
}

class DetailScreen extends ConsumerStatefulWidget {
  final int? id;
  final bool isTv;
  const DetailScreen({super.key, required this.id, required this.isTv});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  SystemUiOverlayStyle _systemUiOverlayStyle = SystemUiOverlayStyle.light;
  Timer? _recentTimer;

  bool _notificationPredicate(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics.axis == Axis.vertical) {
      final pixels = metrics.pixels;

      final newStyle = pixels > 320
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light;

      if (_systemUiOverlayStyle != newStyle) {
        setState(() => _systemUiOverlayStyle = newStyle);
      }
    }
    return true;
  }

  @override
  void dispose() {
    _recentTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTv = widget.isTv;
    final id = widget.id;

    final provider = isTv
        ? getTvDetailProvider(id)
        : getMovieDetailProvider(id);
    final state = ref.watch(provider);

    final scrolled = _systemUiOverlayStyle == SystemUiOverlayStyle.dark;

    ref.listen(provider, (previous, next) {
      if (next.hasValue && next.value != null) {
        final movieData = next.value!.copyWith(
          mediaType: isTv ? MediaType.tv : MediaType.movie,
        );

        _recentTimer?.cancel();

        _recentTimer = Timer(Duration(seconds: 3), () {
          ref.read(recentProvider.notifier).addRecent(movieData);
        });
      }
    });

    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: scrolled ? 0 : null,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: _systemUiOverlayStyle,
            forceMaterialTransparency: !scrolled,
            notificationPredicate: _notificationPredicate,
          ),
          body: state.when(
            data: (data) {
              if (data == null) return SizedBox.shrink();
              final budget = data.budget;
              final revenue = data.revenue;
              final score = data.voteAverage.toScorePercent(data.voteCount);
              final title = data.displayTitle;

              final watchlist = ref.watch(watchlistProvider);
              final isWatchlisted = watchlist.any((m) => m.id == data.id);

              return RefreshIndicator.adaptive(
                onRefresh: () async => await ref.refresh(provider),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          TmdbImage(
                            data.posterPath,
                            width: double.infinity,
                            height: 390,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            height: 120,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF020617),
                                    Color(0x00020617),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 150,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xFF020617),
                                    Color(0x00020617),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            bottom: 24,
                            right: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFFFAFAFA),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  data.genres
                                          ?.map((genre) => genre.name)
                                          .join(', ') ??
                                      '',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  spacing: 8,
                                  children: [
                                    if (data.adult == true)
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.5,
                                            color: Color(0xFFEEEEEE),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          'R',
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                      ),
                                    Row(
                                      spacing: 4,
                                      children: [
                                        Text(
                                          data.releaseDate.toSlashDate,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        Text(
                                          '(${data.originCountry?.first ?? ''})',
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.33),
                                          child: Container(
                                            width: 3.33,
                                            height: 3.33,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        if (data.runtime.hasValue)
                                          Text(
                                            data.runtime.toHoursAndMinutes,
                                            style: GoogleFonts.plusJakartaSans(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 8,
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(64, 40),
                                        ),
                                        onPressed: () {},
                                        icon: Icon(PhosphorIconsFill.play),
                                        label: Text('Lihat Trailer'),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          final dataToSave = data.copyWith(
                                            mediaType: isTv
                                                ? MediaType.tv
                                                : MediaType.movie,
                                          );

                                          ref
                                              .read(watchlistProvider.notifier)
                                              .toggleWatchlist(dataToSave);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(64, 40),
                                          backgroundColor: Colors.white
                                              .withValues(alpha: 0.25),
                                          side: isWatchlisted
                                              ? BorderSide(
                                                  color: Color(0xFF22C55E),
                                                )
                                              : null,
                                        ),
                                        icon: Icon(
                                          isWatchlisted
                                              ? PhosphorIconsFill.checkCircle
                                              : PhosphorIconsRegular.plus,
                                          color: isWatchlisted
                                              ? Color(0xFF22C55E)
                                              : null,
                                        ),
                                        label: Text('Watchlist'),
                                      ),
                                      Container(
                                        height: 40,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                        ).copyWith(left: 16, right: 20),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFACC15),
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              PhosphorIconsFill.star,
                                              size: 10,
                                              color: Color(0xFF713F12),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              score != null ? '$score' : 'NR',
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                    fontSize: 10,
                                                    color: Color(0xFF713F12),
                                                  ),
                                            ),
                                            if (score != null)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 1,
                                                ),
                                                child: Text(
                                                  '%',
                                                  style:
                                                      GoogleFonts.plusJakartaSans(
                                                        fontSize: 8,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _container(
                        spacing: 24,
                        children: [
                          if (data.overview.hasValue)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  'Gambaran Umum',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  data.overview ?? '',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Color(0xFF71747D),
                                  ),
                                ),
                              ],
                            ),
                          if (data.overview.hasValue) Divider(height: 0),
                          CreditGridSection(id: id, isTv: isTv),
                        ],
                      ),
                      CreditSection(id: id, isTv: isTv, title: title),
                      _container(
                        spacing: 12,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              Label(label: 'Status', value: data.status),
                              Label(
                                label: 'Bahasa Ucapan',
                                value: data.spokenLanguages
                                    ?.map((language) => language.name)
                                    .join(', '),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            children: [
                              Label(label: 'Anggaran', value: budget),
                              Label(label: 'Pemasukan', value: revenue),
                            ],
                          ),
                        ],
                      ),
                      ReviewSection(id: id, isTv: isTv),
                      SizedBox(height: 34),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return SizedBox.shrink();
            },
            loading: () => Center(child: CircularProgressIndicator.adaptive()),
          ),
        ),
        Positioned(
          left: 24,
          top: MediaQuery.of(context).padding.top + 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: (scrolled ? Colors.black : Colors.white).withValues(
                      alpha: 0.2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconTheme(
                    data: Theme.of(context).iconTheme.copyWith(
                      color: scrolled ? Color(0xFF1F2937) : Colors.white,
                    ),
                    child: BackButtonIcon(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

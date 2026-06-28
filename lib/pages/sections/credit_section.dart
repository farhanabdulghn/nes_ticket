import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/title_page.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/pages/screens/credit_screen.dart';
import 'package:nes_ticket/states/actions/credits/credits_state.dart';

class CreditSection extends ConsumerWidget {
  final int? id;
  final bool isTv;
  final String title;
  const CreditSection({
    super.key,
    required this.id,
    required this.isTv,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getCreditsCastProvider(id: id, isTv: isTv));

    return state.when(
      data: (datas) {
        if (datas.hasNoValue) return SizedBox.shrink();

        final limitedDatas = datas!.take(5);

        return Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          color: Color(0xFFFAFAFA),
          child: Column(
            spacing: 12,
            children: [
              TitlePage(
                title: 'Pemeran & Kru',
                onTap: () => context.push(
                  CreditScreen(id: id, isTv: isTv, title: title),
                ),
              ),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  spacing: 8,
                  children: limitedDatas.map((cast) {
                    return GestureDetector(
                      child: SizedBox(
                        width: 140,
                        child: Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              TmdbImage(
                                cast.profilePath,
                                height: 140,
                                width: double.infinity,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                ).copyWith(bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      cast.character ?? '',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      cast.name ?? '',
                                      style: GoogleFonts.plusJakartaSans(
                                        color: Color(0xFF71747D),
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
      error: (error, stackTrace) {
        return SizedBox.shrink();
      },
      loading: () => Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

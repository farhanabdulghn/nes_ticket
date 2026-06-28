import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/title_page.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/key_label/key_label_model.dart';
import 'package:nes_ticket/pages/screens/media_by_genre_screen.dart';
import 'package:nes_ticket/states/actions/genres/genres_state.dart';

Widget _buildCard(
  BuildContext context, {
  required String title,
  required AsyncValue<List<KeyLabelModel>> asyncValue,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8,
    children: [
      Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color(0xFF71747D),
        ),
      ),
      asyncValue.maybeWhen(
        data: (datas) {
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            children: datas.map((data) {
              return GestureDetector(
                onTap: () => context.push(
                  MediaByGenreScreen(genre: data, isTv: title != 'Film'),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    border: Border.all(
                      color: Color(0x71747D1A).withValues(alpha: 0.1),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(data.name ?? ''),
                ),
              );
            }).toList(),
          );
        },
        orElse: () => SizedBox.shrink(),
      ),
    ],
  );
}

class CategoriesSection extends ConsumerWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieGenres = ref.watch(getMovieGenresProvider);
    final tvGenres = ref.watch(getTvGenresProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TitlePage(title: 'Jelajahi Film & Serial TV', horizontalPadding: 0),
          _buildCard(context, title: 'Film', asyncValue: movieGenres),
          _buildCard(context, title: 'Serial TV', asyncValue: tvGenres),
        ],
      ),
    );
  }
}

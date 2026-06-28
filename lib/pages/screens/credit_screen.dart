import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/empty_card.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:nes_ticket/models/member/member_model.dart';
import 'package:nes_ticket/states/actions/credits/credits_state.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

enum Category { all, cast, crew }

class CreditScreen extends ConsumerStatefulWidget {
  final int? id;
  final bool isTv;
  final String title;
  const CreditScreen({
    super.key,
    required this.id,
    required this.isTv,
    required this.title,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreditScreenState();
}

class _CreditScreenState extends ConsumerState<CreditScreen> {
  Category _selectedCategory = Category.all;

  Widget _buildLabel<T>({required String title, required List<T> count}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        spacing: 4,
        children: [
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            '${count.length}',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              color: Color(0xFF71747D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required int? id,
    required String? path,
    required String? title,
    required String? subtitle,
  }) {
    return Card(
      key: ValueKey(id),
      margin: EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.8),
              child: TmdbImage(
                path,
                width: 64,
                height: 64,
                errorIcon: PhosphorIconsFill.user,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title ?? '',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle ?? '',
                  style: GoogleFonts.plusJakartaSans(color: Color(0xFF71747D)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, Category category) {
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
    final provider = getCreditsProvider(id: widget.id, isTv: widget.isTv);

    final state = ref.watch(provider);

    final isAll = _selectedCategory == Category.all;
    final isCast = _selectedCategory == Category.cast;
    final isCrew = _selectedCategory == Category.crew;

    final bottomSpacing = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              'Pemeran & Kru',
              style: GoogleFonts.plusJakartaSans(fontSize: 14),
            ),
            Text(
              widget.title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: Color(0xFF71747D),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              spacing: 8,
              children: [
                _buildFilterChip('Semua', Category.all),
                _buildFilterChip('Pemeran', Category.cast),
                _buildFilterChip('Kru', Category.crew),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => ref.refresh(provider.future),
        child: state.when(
          data: (datas) {
            if (datas == null) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: EmptyCard(
                      'Wah, bagian ini masih kosong',
                      bottomSpacing: bottomSpacing,
                    ),
                  ),
                ],
              );
            }

            final List<Widget> listItems = [];

            final casts = datas.cast ?? [];
            final crews = datas.crew ?? [];

            if (isAll || isCast) {
              if (casts.isNotEmpty) {
                listItems.add(
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: _buildLabel(title: 'Pemeran', count: casts),
                  ),
                );

                listItems.addAll(
                  casts.map(
                    (cast) => _buildCard(
                      id: cast.id,
                      path: cast.profilePath,
                      title: cast.character,
                      subtitle: cast.name,
                    ),
                  ),
                );
              }
            }

            if (isAll || isCrew) {
              if (crews.isNotEmpty) {
                listItems.add(
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12,
                      top: (isAll && casts.isNotEmpty) ? 16 : 0,
                    ),
                    child: _buildLabel(title: 'Kru', count: crews),
                  ),
                );

                final Map<String, List<MemberModel>> groupedCrew = {};
                for (var c in crews) {
                  final department = c.department ?? 'Lainnya';
                  groupedCrew.putIfAbsent(department, () => []).add(c);
                }

                groupedCrew.forEach((department, members) {
                  listItems.add(
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        department,
                        style: GoogleFonts.plusJakartaSans(
                          color: Color(0xFF555555),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );

                  listItems.addAll(
                    members.map(
                      (credit) => _buildCard(
                        id: credit.id,
                        path: credit.profilePath,
                        title: credit.name,
                        subtitle: credit.job,
                      ),
                    ),
                  );
                });
              }
            }

            if (listItems.isEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: EmptyCard(
                      'Wah, tidak ada data di kategori ini',
                      bottomSpacing: bottomSpacing,
                    ),
                  ),
                ],
              );
            }

            return ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return listItems[index];
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

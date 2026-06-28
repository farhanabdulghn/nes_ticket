import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/components/cards/media_vertical_card.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/user/user_model.dart';
import 'package:nes_ticket/pages/screens/detail_screen.dart';
import 'package:nes_ticket/pages/screens/splash_screen.dart';
import 'package:nes_ticket/pages/sections/modal_account_settings_section.dart';
import 'package:nes_ticket/states/stores/auth/auth_notifier.dart';
import 'package:nes_ticket/states/stores/recent/recent_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  Widget _buildHeader({required UserModel? user, required bool compact}) {
    final isGuest = user == null;
    final createdAt = user?.createdAt;

    final avatar = Container(
      width: 64,
      height: 64,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        shape: BoxShape.circle,
      ),
      child: isGuest
          ? Icon(PhosphorIconsFill.user, size: 32, color: Color(0xFF71747D))
          : CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  'https://farhanabdulghn.github.io/hansfolio/assets/images/top_picture.jpg',
            ),
    );

    final nameAndInfo = Column(
      crossAxisAlignment: compact
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: 4,
      children: [
        Text(
          isGuest ? 'Tiketux TMDB' : user.name ?? '',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        Text(
          isGuest ? 'tiketux' : user.email ?? '',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            color: Color(0xFF71747D),
          ),
        ),
        if (createdAt != null) ...[
          Text(
            'Bergabung sejak ${createdAt.toIndoDateMonth}',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              color: Color(0xFF71747D),
            ),
          ),
        ],
      ],
    );

    final actionButton = isGuest
        ? ElevatedButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              if (mounted) context.push(SplashScreen());
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(80, 40),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
            child: Text('Login'),
          )
        : IconButton.outlined(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                backgroundColor: Colors.white,
                builder: (_) => ModalAccountSettingsSection(),
              );
            },
            icon: PhosphorIcon(PhosphorIconsRegular.dotsThree),
          );

    if (compact) {
      return Padding(
        padding: EdgeInsets.fromLTRB(24, 60, 24, 24),
        child: Row(
          children: [
            avatar,
            SizedBox(width: 12),
            Expanded(child: nameAndInfo),
            SizedBox(width: 8),
            actionButton,
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [avatar, nameAndInfo, actionButton],
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    final recents = ref.watch(recentProvider);

    final hasRecent = recents.isNotEmpty;

    if (hasRecent) {
      return Scaffold(
        appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(user: user, compact: true)),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terakhir dilihat',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 100),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 260,
                ),
                itemCount: recents.length,
                itemBuilder: (context, i) {
                  final recent = recents[i];

                  final score = recent.voteAverage.toScorePercent(
                    recent.voteCount,
                  );

                  return GestureDetector(
                    onTap: () => context.push(
                      DetailScreen(
                        id: recent.id,
                        isTv: recent.mediaType == MediaType.tv,
                      ),
                    ),
                    child: SizedBox(
                      child: MediaVerticalCard(
                        path: recent.posterPath,
                        score: score,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(child: _buildHeader(user: user, compact: false)),
    );
  }
}

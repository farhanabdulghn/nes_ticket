import 'package:flutter/material.dart';
import 'package:nes_ticket/gen/assets.gen.dart';
import 'package:nes_ticket/pages/sections/categories_section.dart';
import 'package:nes_ticket/pages/sections/highest_rating_section.dart';
import 'package:nes_ticket/pages/sections/latest_section.dart';
import 'package:nes_ticket/pages/sections/trending_today_section.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SearchController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          spacing: 4,
          children: [
            Assets.icons.ticket3d.image(width: 27.62, height: 27.62),
            Text('TMBD'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(PhosphorIconsRegular.bell, color: Color(0xFF3F55C6)),
          ),
          SearchAnchor(
            builder: (context, controller) {
              return IconButton(
                onPressed: () {
                  controller.openView();
                },
                icon: Icon(
                  PhosphorIconsRegular.magnifyingGlass,
                  color: Color(0xFF3F55C6),
                ),
              );
            },
            suggestionsBuilder: (context, controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          spacing: 24,
          children: [
            TrendingTodaySection(),
            LatestSection(),
            HighestRatingSection(),
            CategoriesSection(),
            SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}

// GENERATED FILE - DO NOT MODIFY BY HAND
// Run with: dart lib/tools/generate_routes.dart

import 'package:flutter/material.dart';
import 'package:nes_ticket/pages/screens/main_frame_screen.dart';
import 'package:nes_ticket/pages/screens/trending_today_screen.dart';
import 'package:nes_ticket/pages/screens/highest_rating_screen.dart';

// ignore_for_file: constant_identifier_names

class AppRoute {
  static const String mainFrame = '/main-frame';
  static const String trendingToday = '/trending-today';
  static const String highestRating = '/highest-rating';
}

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    AppRoute.mainFrame: (context) => const MainFrameScreen(),
    AppRoute.trendingToday: (context) => const TrendingTodayScreen(),
    AppRoute.highestRating: (context) => const HighestRatingScreen(),
  };
}


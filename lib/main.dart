import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/storage/prefs.dart';
import 'features/map/home_map_screen.dart';
import 'features/progress/dashboard_screen.dart';
import 'features/progress/badges_stickers_screen.dart';
import 'features/events/events_hub_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await Prefs.create();
  runApp(EnglishQuestApp(prefs: prefs));
}

class EnglishQuestApp extends StatelessWidget {
  final Prefs prefs;
  const EnglishQuestApp({super.key, required this.prefs});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => prefs)],
      child: MaterialApp(
        title: 'English Quest 4º',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), useMaterial3: true),
        home: const HomeMapScreen(),
        routes: {
          DashboardScreen.routeName: (_) => const DashboardScreen(),
          BadgesStickersScreen.routeName: (_) => const BadgesStickersScreen(),
          EventsHubScreen.routeName: (_) => const EventsHubScreen(),
        },
      ),
    );
  }
}

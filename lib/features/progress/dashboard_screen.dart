import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/storage/prefs.dart';
class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<Prefs>();
    return Scaffold(
      appBar: AppBar(title: const Text('My Progress')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Icon(Icons.monetization_on_outlined, size: 32), const SizedBox(width: 8), Text('Coins: ${prefs.coins}', style: const TextStyle(fontSize: 18))]),
          const SizedBox(height: 16),
          Row(children:[const Icon(Icons.sports_soccer, size:28), const SizedBox(width:8), Text('Goals: ${prefs.goals}', style: const TextStyle(fontSize: 16))]),
          const SizedBox(height: 8),
          Row(children:[const Icon(Icons.eco_outlined, size:28), const SizedBox(width:8), Text('Species: ${prefs.species}', style: const TextStyle(fontSize: 16))]),
          const SizedBox(height: 16), const Text('Badges:', style: TextStyle(fontSize: 18)), const SizedBox(height: 8),
          Wrap(spacing: 8, children: prefs.badges.map((b) => Chip(label: Text(b))).toList()),
          const SizedBox(height: 16), const Text('Stickers:', style: TextStyle(fontSize: 18)), const SizedBox(height: 8),
          Wrap(spacing: 8, children: prefs.stickers.map((s) => Chip(label: Text(s))).toList()),
        ]),
      ),
    );
  }
}

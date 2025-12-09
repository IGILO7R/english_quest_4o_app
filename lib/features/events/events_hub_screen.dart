import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/storage/prefs.dart';
class BadgesStickersScreen extends StatelessWidget {
  static const routeName = '/badges';
  const BadgesStickersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<Prefs>();
    return Scaffold(
      appBar: AppBar(title: const Text('Badges & Stickers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          const Text('Badges', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height:8),
          Wrap(spacing:8, children: prefs.badges.map((b)=> Chip(label: Text(b))).toList()),
          const SizedBox(height:16),
          const Text('Stickers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height:8),
          Wrap(spacing:8, children: prefs.stickers.map((s)=> Chip(label: Text(s))).toList()),
        ]),
      ),
    );
  }
}

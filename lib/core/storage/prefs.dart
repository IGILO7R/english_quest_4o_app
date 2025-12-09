import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs extends ChangeNotifier {
  final SharedPreferences _sp;
  Prefs._(this._sp);
  static Future<Prefs> create() async { final sp = await SharedPreferences.getInstance(); return Prefs._(sp); }

  int get coins => _sp.getInt('coins') ?? 0; set coins(int v) { _sp.setInt('coins', v); notifyListeners(); }
  List<String> get badges => _sp.getStringList('badges') ?? <String>[];
  void addBadge(String b) { final list = badges; if (!list.contains(b)) { list.add(b); _sp.setStringList('badges', list); notifyListeners(); } }

  List<String> get stickers => _sp.getStringList('stickers') ?? <String>[];
  void addSticker(String s) { final list = stickers; if (!list.contains(s)) { list.add(s); _sp.setStringList('stickers', list); notifyListeners(); } }

  int get goals => _sp.getInt('goals') ?? 0; set goals(int v) { _sp.setInt('goals', v); notifyListeners(); }
  int get species => _sp.getInt('species') ?? 0; set species(int v) { _sp.setInt('species', v); notifyListeners(); }

  Future<Map<String, dynamic>> loadUnits() async {
    final raw = await rootBundle.loadString('assets/content/units.json');
    return jsonDecode(raw) as Map<String, dynamic>;
  }

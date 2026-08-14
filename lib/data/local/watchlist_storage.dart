import 'package:shared_preferences/shared_preferences.dart';

/// Local watchlist — like Groww / Coin shortlist.
class WatchlistStorage {
  WatchlistStorage._();
  static final WatchlistStorage instance = WatchlistStorage._();

  static const _key = 'neev_watchlist_ids';
  final List<void Function()> _listeners = [];

  Set<String> _ids = {};
  bool _loaded = false;

  Set<String> get ids => Set.unmodifiable(_ids);

  void addListener(void Function() cb) => _listeners.add(cb);
  void removeListener(void Function() cb) => _listeners.remove(cb);

  void _notify() {
    for (final cb in List.of(_listeners)) {
      cb();
    }
  }

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _ids = (prefs.getStringList(_key) ?? []).toSet();
    _loaded = true;
  }

  bool contains(String fundId) => _ids.contains(fundId);

  Future<void> toggle(String fundId) async {
    await ensureLoaded();
    if (_ids.contains(fundId)) {
      _ids.remove(fundId);
    } else {
      _ids.add(fundId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, _ids.toList());
    _notify();
  }

  Future<void> clear() async {
    await ensureLoaded();
    _ids.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    _notify();
  }
}

import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/core/utils/toast_utils.dart';
import 'package:new_app/data/local/watchlist_storage.dart';

/// Toggle fund on/off watchlist (favorite). Persists via [WatchlistStorage].
class WatchlistToggleButton extends StatefulWidget {
  const WatchlistToggleButton({
    super.key,
    required this.fundId,
    this.fundName,
    this.size = 40,
    this.iconSize = AppIconSizes.md,
    this.filledBackground = true,
  });

  final String fundId;
  final String? fundName;
  final double size;
  final double iconSize;
  final bool filledBackground;

  @override
  State<WatchlistToggleButton> createState() => _WatchlistToggleButtonState();
}

class _WatchlistToggleButtonState extends State<WatchlistToggleButton> {
  bool _saved = false;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _load();
    WatchlistStorage.instance.addListener(_sync);
  }

  Future<void> _load() async {
    await WatchlistStorage.instance.ensureLoaded();
    if (!mounted) return;
    setState(() {
      _saved = WatchlistStorage.instance.contains(widget.fundId);
      _ready = true;
    });
  }

  void _sync() {
    if (!mounted) return;
    setState(() {
      _saved = WatchlistStorage.instance.contains(widget.fundId);
    });
  }

  @override
  void dispose() {
    WatchlistStorage.instance.removeListener(_sync);
    super.dispose();
  }

  Future<void> _toggle() async {
    await WatchlistStorage.instance.toggle(widget.fundId);
    if (!mounted) return;
    final nowSaved = WatchlistStorage.instance.contains(widget.fundId);
    ToastUtils.showToast(
      context,
      message: nowSaved
          ? '${widget.fundName ?? 'Fund'} added to wishlist'
          : '${widget.fundName ?? 'Fund'} removed from wishlist',
      type: nowSaved ? ToastType.success : ToastType.info,
    );
  }

  @override
  Widget build(BuildContext context) {
    final icon = AppIcon(
      AppIcons.favorite(filled: _saved),
      size: widget.iconSize,
      color: _saved ? AppColors.error : AppColors.textPrimary,
    );

    if (!widget.filledBackground) {
      return IconButton(
        onPressed: _ready ? _toggle : null,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: widget.size,
          minHeight: widget.size,
        ),
        icon: icon,
      );
    }

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _ready ? _toggle : null,
        child: Container(
          width: widget.size,
          height: widget.size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardBorder),
            boxShadow: AppColors.cardShadow,
          ),
          child: icon,
        ),
      ),
    );
  }
}

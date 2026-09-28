/// Touch-friendly icon sizes used across the app.
class AppIconSizes {
  AppIconSizes._();

  /// Tiny inline icons (badges, compact rows).
  static const xs = 16.0;

  /// Back, bell, chevrons inside ~40px controls.
  static const sm = 20.0;

  /// List rows, menu items, search fields.
  static const md = 22.0;

  /// Bottom navigation tabs.
  static const nav = 24.0;

  /// Quick-action tiles and prominent buttons.
  static const lg = 26.0;

  /// Payment tiles, empty states.
  static const xl = 28.0;

  /// Success / hero badges.
  static const hero = 40.0;

  /// Stroke SVGs read slightly smaller than filled Material icons.
  static double svg(double logical) => logical * 1.12;
}

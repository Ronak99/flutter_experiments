import 'package:flutter_riverpod/flutter_riverpod.dart';

var themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>(
    (ref) => ThemeNotifier(ref));

class ThemeNotifier extends StateNotifier<ThemeState> {
  StateNotifierProviderRef ref;

// Constructor
  ThemeNotifier(this.ref) : super(ThemeState(isDark: false));

  toggleTheme() {
    state = state.copyWith(isDark: !state.isDark);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ThemeState {
  bool isDark;
  ThemeState({
    required this.isDark,
  });

  ThemeState copyWith({
    bool? isDark,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
    );
  }
}

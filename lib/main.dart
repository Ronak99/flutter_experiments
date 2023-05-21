import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_shorts/provider/theme_provider.dart';

import 'theme/theme_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: ref.watch(themeProvider).isDark
            ? Brightness.dark
            : Brightness.light,
      ),
      home: const Scaffold(
        body: Center(
          child: ThemeScreen(),
        ),
      ),
    );
  }
}

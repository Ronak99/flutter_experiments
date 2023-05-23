import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_shorts/content/circular_clipper.dart';
import 'package:youtube_shorts/provider/theme_provider.dart';

class ContentScreen extends ConsumerStatefulWidget {
  const ContentScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends ConsumerState<ContentScreen>
    with TickerProviderStateMixin {
  late AnimationController _clipperAnimationController;
  late Animation<double> _clipperRadiusAnimation;
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor =
        ref.read(themeProvider).isDark ? Colors.black : Colors.white;

    _clipperAnimationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    _clipperRadiusAnimation = Tween<double>(begin: 0, end: 1200).animate(
        CurvedAnimation(
            parent: _clipperAnimationController, curve: Curves.ease));
    _clipperRadiusAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    _clipperAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
              _clipperAnimationController.reset();
              _clipperAnimationController.forward().then((value) => {
                    setState(() {
                      _backgroundColor = ref.read(themeProvider).isDark
                          ? Colors.black
                          : Colors.white;
                    })
                  });
            },
            icon: ref.watch(themeProvider).isDark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: _backgroundColor,
            ),
          ),
          Center(
            child: Builder(
              builder: (builderContext) {
                return ClipPath(
                  clipper: CircularClipper(
                    centerX: width,
                    centerY: 0,
                    radius: _clipperRadiusAnimation.value,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ref.watch(themeProvider).isDark
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Fill This Form",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "First Name"),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "Last Name"),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: const Text("Submit Form"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Reset Form"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

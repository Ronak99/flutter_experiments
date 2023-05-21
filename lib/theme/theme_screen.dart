import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
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
    );
  }
}

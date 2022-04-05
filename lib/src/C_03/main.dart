import 'package:flutter/material.dart';

void main() {
  runApp(const FadApp());
}

class FadApp extends StatelessWidget {
  const FadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Item $index',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}

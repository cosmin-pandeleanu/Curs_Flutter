import 'package:flutter/material.dart';

void main() {
  runApp(const FairApp());
}

class FairApp extends StatelessWidget {
  const FairApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Define a variable that will change
  // 2. Use the variable to build UI in the build method
  // 3. Change the variable inside the setState method
  bool _isDariana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text(_isDariana ? 'Dariana' : 'Razvan'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isDariana = !_isDariana;
              });
            },
            child: const Text('Change name'),
          )
        ],
      ),
    );
  }
}

// String _name = 'Razvan';
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(),
//     body: Column(
//       children: <Widget>[
//         Text(_name),
//         ElevatedButton(
//           onPressed: () {
//             _name = _name == 'Razvan' ? 'Dariana' : 'Razvan';
//           },
//           child: const Text('Change name'),
//         )
//       ],
//     ),
//   );
// }

class ColorBox extends StatefulWidget {
  const ColorBox({Key? key}) : super(key: key);

  @override
  State<ColorBox> createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

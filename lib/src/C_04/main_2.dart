// import 'package:flutter/material.dart';
//
// void main() {
//   runApp( const FairApp());
// }
//
// class FairApp extends StatelessWidget {
//   const FairApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // 1. Define a variable that will change
//   // 2. Use the variable to build UI in the build method
//   // 3. Change the variable inside the setState method
//   final List<String> _options = <String> ['ardei', 'ceapa', 'rosii'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       // body: ListView.builder(
//       //   itemCount: _options.length,
//       //   itemBuilder: (BuildContext context, int index) {
//       //     final String item = _options[index];
//       //     },
//       // ),
//     );
//   }
// }

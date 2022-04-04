import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  HomePage createState() {
    return HomePage();
  }
}

class HomePage extends State<MyHomePage> {
  TextEditingController myController = TextEditingController();
  bool valid = false;
  String amount = '';
  double conversionRate = 4.95;

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? errorContent() {
    if (valid == true) {
      return 'please enter a number';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Currency converter')),
      ),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: NetworkImage("https://i0.1616.ro/media/2/2621/33243/20450766/1/9v8a2732.jpg?width=535"),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'enter the amount in EUR',
                  errorText: errorContent(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isNumeric(myController.text) == false) {
                    amount = '';
                    valid = true;
                  } else {
                    amount = (double.parse(myController.text) * conversionRate).toStringAsFixed(2) + ' RON';
                    valid = false;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(230, 215, 206, 206),
                onPrimary: Colors.black87,
              ),
              child: const Text('CONVERT!',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

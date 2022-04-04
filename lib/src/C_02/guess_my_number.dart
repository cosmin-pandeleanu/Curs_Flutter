import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const GuessMyNumber());
}

class GuessMyNumber extends StatelessWidget {
  const GuessMyNumber({Key? key}) : super(key: key);

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
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';
  String _textButton = 'Guess';
  int _generatedNumber = Random().nextInt(100) + 1;
  bool _textFieldEnabled = true;

  showAlertDialog(BuildContext context) {
    Widget tryAgainButton = TextButton(
      onPressed: () {
        setState(() {
          _feedback = '';
          _generatedNumber = Random().nextInt(100) + 1;
          Navigator.pop(context);
        });
      },
      child: const Text('Try again!'),
    );
    Widget okButton = TextButton(
      onPressed: () {
        setState(() {
          _textFieldEnabled = false;
          _textButton = 'Reset';
          _feedback = '';
          _generatedNumber = Random().nextInt(100) + 1;
          Navigator.pop(context);
        });
      },
      child: const Text('OK'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text("You guessed right"),
      content: Text("It was $_generatedNumber"),
      actions: [
        tryAgainButton,
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Guess my number')),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "I'm thinking of a number between 1 and 100.",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "It's your turn to guess my number!",
              style: TextStyle(
                fontSize: 22,
                fontFamily: '',
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 35, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Try a number!",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey,
                    ),
                  ),
                  TextFormField(
                    controller: _controller,
                    enabled: _textFieldEnabled,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        onPressed: () {
                          if (_textButton == 'Guess' && _controller.text != '') {
                            int value = int.parse(_controller.text);
                            if (value < _generatedNumber) {
                              setState(() {
                                _feedback = 'You tried $value\nTry higher';
                              });
                            } else if (value > _generatedNumber) {
                              setState(() {
                                _feedback = 'You tried $value\nTry lower';
                              });
                            } else if (value == _generatedNumber) {
                              setState(() {
                                showAlertDialog(context);
                              });
                            }
                            _controller.clear();
                          } else if (_textButton == "Reset") {
                            setState(() {
                              _textFieldEnabled = true;
                              _textButton = "Guess";
                            });
                          }
                        },
                        child: Text(_textButton));
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

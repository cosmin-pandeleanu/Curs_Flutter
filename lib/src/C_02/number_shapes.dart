import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const NumberShapes());
}

class NumberShapes extends StatelessWidget {
  const NumberShapes({Key? key}) : super(key: key);

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
  int _inputNumber = 0;

  bool _isPerfectSquare(int n) {
    return n == pow(sqrt(n).round(), 2);
  }

  bool _isPerfectCube(int n) {
    return n == pow(pow(n, 1 / 3).round(), 3);
  }

  String _message() {
    final String _str = 'Number $_inputNumber is ';
    if (_isPerfectSquare(_inputNumber)) {
      if (_isPerfectCube(_inputNumber)) {
        return '${_str}both SQUARE and TRIANGULAR.';
      } else {
        return '${_str}SQUARE.';
      }
    } else if (_isPerfectCube(_inputNumber)) {
      return '${_str}CUBE.';
    }
    return '${_str}neither TRIANGULAR or SQUARE.';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Number Shapes'),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'Please input a number to see if it is square or triangular.',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: _controller,
                onChanged: (String value) {
                  setState(() {
                    if (int.tryParse(value) != null) {
                      setState(() {
                        _inputNumber = int.parse(value);
                      });
                    }
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<BuildContext>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('$_inputNumber'),
                  content: Text(_message()),
                );
              },
            );
            _controller.clear();
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}

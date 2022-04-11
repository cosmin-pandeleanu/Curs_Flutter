import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

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
  late List<int> _state;
  bool _isX = true;
  bool _isWinner = false;
  static const List<List<int>> _winConditions = <List<int>>[
    <int>[0, 1, 2],
    <int>[3, 4, 5],
    <int>[6, 7, 8],
    <int>[0, 3, 6],
    <int>[1, 4, 7],
    <int>[2, 5, 8],
    <int>[0, 4, 8],
    <int>[2, 4, 6],
  ];

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _isWinner = false;
        _state = <int>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
        ];
      },
    );
  }

  Color _getColor(int value) {
    switch (value) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }

  void _play(int index) {
    if (_state[index] == 0) {
      setState(
        () {
          if (_isX) {
            _state[index] = 1;
          } else {
            _state[index] = 2;
          }
          _isX = !_isX;
          _checkWin();
        },
      );
    }
  }

  void _setWinner(List<int> winnerList) {
    setState(
      () {
        for (int i = 0; i < _state.length; i++) {
          if (i != winnerList[0] && i != winnerList[1] && i != winnerList[2]) {
            _state[i] = 0;
            _isWinner = true;
          }
        }
      },
    );
  }

  void _checkWin() {
    for (final List<int> condition in _winConditions) {
      if ((_state[condition[0]] != 0) &&
          (_state[condition[0]] == _state[condition[1]]) &&
          (_state[condition[1]] == _state[condition[2]])) {
        _setWinner(condition);
      } else if (!_state.contains(0)) {
        setState(
          () {
            _isWinner = true;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tic Tac Toe',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.9,
                      color: Colors.blueGrey,
                    ),
                  ),
                  child: TextButton(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: _getColor(_state[index]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _play(index);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          if (_isWinner)
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      for (int i = 0; i < _state.length; i++) {
                        _state[i] = 0;
                      }
                      _isWinner = false;
                    },
                  );
                },
                child: const Text('Play Again!'),
              ),
            )
        ],
      ),
    );
  }
}

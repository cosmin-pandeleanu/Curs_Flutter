import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicPhrases());
}

class BasicPhrases extends StatelessWidget {
  const BasicPhrases({Key? key}) : super(key: key);

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

class Phrase {
  Phrase(this.romanianPhrase, this.romanianFileLocation, this.spanishFileLocation);
  final String romanianPhrase;
  final String romanianFileLocation;
  final String spanishFileLocation;
}

class _HomePageState extends State<HomePage> {
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  final List<Phrase> _phrases = <Phrase>[
    Phrase(
      'Salut!',
      'assets/sound/salut_ro.mp3',
      'assets/sound/salut_sp.mp3',
    ),
    Phrase(
      'Mă numesc',
      'assets/sound/ma_numesc_ro.mp3',
      'assets/sound/ma_numesc_sp.mp3',
    ),
    Phrase(
      'Cum ești?',
      'assets/sound/cum_esti_ro.mp3',
      'assets/sound/cum_esti_sp.mp3',
    ),
    Phrase(
      'Sunt bine.',
      'assets/sound/sunt_bine_ro.mp3',
      'assets/sound/sunt_bine_sp.mp3',
    ),
    Phrase(
      'La revedere!',
      'assets/sound/la_revedere_ro.mp3',
      'assets/sound/la_revedere_sp.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Basic Phrases'),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 32,
          mainAxisSpacing: 32,
        ),
        itemCount: _phrases.length * 2,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: <Color>[Colors.blue, Colors.lightBlueAccent],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SizedBox.expand(
                child: MaterialButton(
                  onPressed: () async {
                    final Audio audio = i.isEven
                        ? Audio(
                            _phrases[i ~/ 2].romanianFileLocation,
                          )
                        : Audio(
                            _phrases[i ~/ 2].spanishFileLocation,
                          );
                    await _audioPlayer.stop();
                    await _audioPlayer.open(
                      audio,
                      autoStart: false,
                      showNotification: true,
                    );
                    await _audioPlayer.play();
                  },
                  child: Center(
                    child: Text(
                      i.isEven ? _phrases[i ~/ 2].romanianPhrase : '${_phrases[i ~/ 2].romanianPhrase} (spaniolă)',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

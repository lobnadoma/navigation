import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class WordsDictionary {
  String? word;
  String? originalWord;

  WordsDictionary({this.word, this.originalWord});
}

class SpeachText extends StatefulWidget {
  const SpeachText({Key? key}) : super(key: key);

  @override
  _SpeachTextState createState() => _SpeachTextState();
}

class _SpeachTextState extends State<SpeachText> {
  // List<WordsDictionary> wordsDictionary = [
  //   WordsDictionary(word: "Kitchen", originalWord: "Kitchen"),
  //   WordsDictionary(word: "cooking area", originalWord: "Kitchen"),
  // ];
  Map<String, String> wordsDictionaryMap = {
    "kitchen": "kitchen",
    "cooking area": "kitchen",
    "kitchenette": "kitchen",
    "cookery": "kitchen",
    "bathroom": "bathroom",
    "restroom": "bathroom",
    "toilet": "bathroom",
    "washroom": "bathroom",
    "meeting room": "meeting room",
    "boardroom": "meeting room",
    "assembly room": "meeting room",
    "hall": "meeting room",
    "hr room ": "hr room ",
    "hr": "hr room "
  };

  List<String> words = [];

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      words = _lastWords.split(' ');
      words.removeWhere((item) => !wordsDictionaryMap.keys.contains(item));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? '$_lastWords'
                      // If listening isn't active but could be tell the user
                      // how to start it, otherwise indicate that speech
                      // recognition is not yet ready or not supported on
                      // the target device
                      : _speechEnabled
                          ? 'Tap the microphone to start listening...'
                          : 'Speech not available',
                ),
              ),
            ),
            ListView.builder(
                itemCount: words.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Text('WORD::' + words[index]);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // If not yet listening for speech start, otherwise stop
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}

import 'package:deprem_projesi/quiz/quiz.dart';
import 'package:deprem_projesi/quiz/result.dart';
import 'package:flutter/material.dart';

import '../dasbord.dart';

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'Did those around you also feel this earthquake?',
      'answers': [
        {'text': 'There was no one around me', 'score': 0},
        {'text': 'Those around me didnt feel', 'score': 1},
        {'text': 'Bazı kişiler hissetti ama çoğunluk hisetmedi', 'score': 2},
        {'text': 'Some people felt but most did not', 'score': 3},
        {'text': 'Everyone around me felt', 'score': 4},
      ],
    },
    {
      'questionText': 'Hows the earthquake?',
      'answers': [
        {'text': 'I felt so light', 'score': 0},
        {'text': 'Weak', 'score': 1},
        {'text': 'moderate', 'score': 2},
        {'text': 'Strong', 'score': 3},
        {'text': 'Very strong', 'score': 4},
      ],
    },
    {
      'questionText': 'What was your reaction to the earthquake?',
      'answers': [
        {'text': 'I did not show any reaction', 'score': 0},
        {'text': 'I was excited', 'score': 1},
        {'text': 'I scared', 'score': 2},
        {'text': 'I was so scared', 'score': 3},
        {'text': 'I didnt know what to do out of fear', 'score': 4},
      ],
    },
    {
      'questionText': 'Depreme sırasında ayakta durmak veya yürümek zor muydu?',
      'answers': [
        {'text': 'Hayır', 'score': 0},
        {'text': 'Evet', 'score': 1},
      ],
    },
    {
      'questionText': 'Raflardaki eşyalar devrildi veya düştü mü?',
      'answers': [
        {'text': 'Hayır, sadece sallandılar', 'score': 0},
        {'text': 'Birkaç tane eşya devrildi ya da yere düştü', 'score': 1},
        {'text': 'Çoğu eşya yere düştü', 'score': 2},
        {'text': 'Raflardaki herşey yere düştü', 'score': 3},
      ],
    },
    {
      'questionText': ' Duvarlardaki resimler düştü veya eğrildi mi?',
      'answers': [
        {'text': 'Hayır', 'score': 0},
        {'text': 'Evet, ama yere düşmediler', 'score': 1},
        {'text': 'Evet, bazıları yere düştü', 'score': 2},
      ],
    },
    {
      'questionText':
          'Mobilyalar veya beyaz eşyalar kaydı, devrildi veya yer değiştirdi mi?',
      'answers': [
        {'text': 'Hayır', 'score': 0},
        {'text': 'Evet', 'score': 1},
      ],
    },
    {
      'questionText': 'Bina içinde hasar oluştu mu?',
      'answers': [
        {'text': 'Herhangi bir hasar oluşmadı', 'score': 0},
        {'text': 'Duvarlarda ince çatlaklar oluştu', 'score': 1},
        {'text': 'Birkaç cam çatladı', 'score': 2},
        {'text': 'Duvarlarda birkaç büyük çatlak oluştu', 'score': 3},
        {'text': 'Duvarlarda birçok büyük çatlak oluştu', 'score': 4},
        {'text': 'Lambalar ve tavan kaplamaları yere düştü', 'score': 5},
        {'text': 'Camlar kırılarak dışarı döküldü', 'score': 6},
        {'text': 'Tuğla duvarlardan tuğlalar söküldü', 'score': 7},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff80B34F),
        title: Text("I Feel EarthQuake"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuDashboardPage()));
            }),
        centerTitle: true,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    );
  }
}

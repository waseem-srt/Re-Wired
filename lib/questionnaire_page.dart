import 'package:flutter/material.dart';
import 'loading_page.dart';
import 'main_menu_page.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  int _questionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'How old are you?',
      'answers': ['Under 18', '18–24', '25–34', '35–44', '45+'],
    },
    {
      'questionText': 'How long ago did you start watching porn?',
      'answers': [
        'This year',
        '1–3 years ago',
        '4–7 years ago',
        '8–10 years ago',
        'Over 10 years ago'
      ],
    },
    {
      'questionText': 'How often do you watch explicit content?',
      'answers': [
        'More than once a day',
        'Once a day',
        'Few times a week',
        'Few times a month',
        'Once a month'
      ],
    },
    {
      'questionText':
          'Do you struggle to feel sexually stimulated without relying on pornography?',
      'answers': ['Frequently', 'Occasionally', 'Rarely', 'Never'],
    },
    {
      'questionText': 'What are some reasons you watch explicit content?',
      'answers': [
        'Boredom',
        'To avoid stress',
        'Lack of social activity',
        'To avoid emotional pain',
        'Other reasons'
      ],
    },
  ];
  void _skipAll() {
    setState(() {
      _questionIndex = _questions.length;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainMenuPage()),
    );
  }

  void _answerQuestion(String answer) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen: $answer');
    if (_questionIndex >= _questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: _skipAll,
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: _questionIndex < _questions.length
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    '${_questionIndex + 1}/${_questions.length}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _questions[_questionIndex]['questionText'] as String,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ...(_questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding: EdgeInsets.symmetric(vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          answer,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
          : Center(
              child: Text('Quiz Complete!'),
            ),
    );
  }
}

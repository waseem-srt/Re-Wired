import 'package:flutter/material.dart';
import 'main_menu_page.dart';

class SetStreakPage extends StatefulWidget {
  const SetStreakPage({super.key});

  @override
  _SetStreakPageState createState() => _SetStreakPageState();
}

class _SetStreakPageState extends State<SetStreakPage> {
  double _streak = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Set your Current Streak',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'What’s your current streak?',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              '"Streak" refers to the number of days since you last watched pornography or masturbated',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '${_streak.toInt()} days',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _streak,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${_streak.toInt()}',
              onChanged: (double value) {
                setState(() {
                  _streak = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainMenuPage(),
                  ),
                );
              },
              child: Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}

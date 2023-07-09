import 'package:alphabets/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'barakhadi_data.dart';
import 'barakhadi_screen.dart';

void main() {
  runApp(BarakhadiApp());
}

class BarakhadiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barakhadi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String currentBarakhadi = '';
  List<String> wrongList = [];
  int correctScore = 0;
  int wrongScore = 0;

  @override
  void initState() {
    super.initState();
    generateRandomBarakhadi();
  }

  void generateRandomBarakhadi() {
    final randomBarakhadi =
        BarakhadiData.generateRandomBarakhadiFromBarakhadiTable();

    setState(() {
      currentBarakhadi = randomBarakhadi;
    });
  }

  void handleCorrectAnswer() {
    setState(() {
      correctScore++;
    });
    generateRandomBarakhadi();
  }

  void handleWrongAnswer() {
    setState(() {
      wrongScore++;
      wrongList.add(currentBarakhadi);
    });
    generateRandomBarakhadi();
  }

  void stopTest() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Test Results'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Correct Score: $correctScore'),
              Text('Wrong Score: $wrongScore'),
              SizedBox(height: 16),
              Text('Wrong List:'),
              Text(wrongList.join(', ')),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barakhadi'),
        actions: [
          IconButton(
            icon: Icon(Icons.video_library),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BarakhadiScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentBarakhadi,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: handleCorrectAnswer,
                  child: Text('Correct'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: handleWrongAnswer,
                  child: Text('Wrong'),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: stopTest,
              child: Text('Stop Test'),
            ),
          ],
        ),
      ),
    );
  }
}

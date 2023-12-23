import 'package:flutter/material.dart';
import 'dart:async';

/// Flutter code sample for [AppBar].

void main() => runApp(PomodoroApp());

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      home: PomodoroTimer(),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int _cycle = 1;
  int _timeLeft = 25 * 60; // 25 minutes in seconds
  bool _isBreak = false;
  bool _isRunning = false;
  Timer? _timer;

  _startOrPauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_timeLeft > 0) {
            _timeLeft--;
          } else {
            _nextCycle();
          }
        });
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  _nextCycle() {
    _timer?.cancel();
    if (_isBreak) {
      _cycle++;
      if (_cycle > 4) _cycle = 1;
      _timeLeft = 25 * 60;
    } else {
      if (_cycle == 4) {
        _timeLeft = 15 * 60;
      } else {
        _timeLeft = 5 * 60;
      }
    }
    setState(() {
      _isBreak = !_isBreak;
      _isRunning = false;
    });
  }

  _resetTimer() {
    _timer?.cancel();
    setState(() {
      _cycle = 1;
      _timeLeft = 25 * 60;
      _isBreak = false;
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pomodoro Timer',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cycle $_cycle ${_isBreak ? "Break" : "Work"}',
          ),
          TimerDisplay(seconds: _timeLeft),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _isRunning ? Icons.pause : Icons.play_arrow,
                  size: 30,
                ),
                onPressed: _startOrPauseTimer,
              ),
              SizedBox(
                width: 70,
                height: 30,
              ), // 원하는 가로 간격을 설정
              IconButton(
                icon: Icon(
                  Icons.skip_next,
                  size: 30,
                ),
                onPressed: _nextCycle,
              ),
              SizedBox(
                width: 60,
                height: 30,
              ), // 원하는 가로 간격을 설정
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: 30,
                ),
                onPressed: _resetTimer,
              ),
            ],
          )
        ],
      )),
    );
  }
}

class TimerDisplay extends StatelessWidget {
  final int seconds;
  TimerDisplay({required this.seconds});

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return Text(
      '$minutes:${remainingSeconds.toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 88),
    );
  }
}

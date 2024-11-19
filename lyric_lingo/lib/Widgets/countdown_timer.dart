import 'dart:async';
import 'package:flutter/material.dart';


class CountdownTimer extends StatefulWidget {
  final Duration initialDuration = const Duration(days: 7);

  const CountdownTimer(Key? key) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration duration;
  Timer? timer;

  @override 
  void initState() {
    super.initState();
    duration = const Duration(days: 7);
    startTimer();
  }

  void addTime() {
    setState(() {
      final seconds = duration.inSeconds + 1;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final days = twoDigits(duration.inDays.remainder(7));
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$days:$hours:$minutes:$seconds',
      style: const TextStyle(
        fontSize: 40,
        fontFamily: 'Helvetica',
        color: Color.fromARGB(255, 237, 232, 221),
        ),
    );
  }

  @override
  Widget build(BuildContext context) => buildTime();
}
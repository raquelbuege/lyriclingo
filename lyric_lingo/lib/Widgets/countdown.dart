import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {

  const CountdownTimer(Key? key) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration duration;
  static const countDownDuration = Duration(days: 7);
  Timer? timer;

  @override 
  void initState() {
    super.initState();
    duration = const Duration(days: 7);
    startTimer();
    reset();
  }

  void removeTime() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      duration = Duration(seconds: seconds);

      if (seconds < 0) {
        reset();
      }
    });
  }

  void reset() {
    setState(() => duration = countDownDuration);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => removeTime());
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final days = twoDigits(duration.inDays.remainder(7));
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(type: "Day", time: days),
        const SizedBox(width: 8),
        buildTimeCard(type: "Hour", time: hours),
        const SizedBox(width: 8),
        buildTimeCard(type: "Min", time: minutes),
        const SizedBox(width: 8),
        buildTimeCard(type: "Sec", time: seconds)
      ],
    );
  }

Widget buildTimeCard({required String type, required String time}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
    color: const Color.fromARGB(255, 237, 232, 221),
    borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type,
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 53, 45, 57),
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 70,
            color: Color.fromARGB(255, 105, 95, 110),
            fontFamily: 'Coolvetica',
          ),
        ),
      ],
    )
    );
  }

  @override
  Widget build(BuildContext context) => buildTime();
}

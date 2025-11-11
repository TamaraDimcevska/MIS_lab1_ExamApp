import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    Duration remaining = exam.dateTime.difference(DateTime.now());
    int days = remaining.inDays;
    int hours = remaining.inHours.remainder(24);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            exam.subjectName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: exam.hasPassed ? Colors.greenAccent : Colors.pink[300],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8),
                Text(DateFormat('dd.MM.yyyy').format(exam.dateTime)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8),
                Text(DateFormat('HH:mm').format(exam.dateTime)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.room),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    exam.rooms.join(', '),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              exam.hasPassed
                  ? "Овој испит е поминат."
                  : "До испитот има уште: $days дена, $hours часа.",
              style: TextStyle(
                color: exam.hasPassed ? Colors.greenAccent : Colors.pink[300],
                fontSize: 12.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
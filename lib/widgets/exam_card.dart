import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    bool isPassed = exam.dateTime.isBefore(DateTime.now());
    Color cardColor = isPassed ? Colors.greenAccent[200]! : Colors.pink[100]!;

    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(exam.subjectName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    DateFormat('dd.MM.yyyy').format(exam.dateTime),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    DateFormat('HH:mm').format(exam.dateTime),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    exam.rooms.join(', '),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
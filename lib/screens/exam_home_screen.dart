import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final List<Exam> exams = [
    Exam(subjectName: 'Напредно програмирање',
        dateTime: DateTime(2025, 10, 15, 10, 0),
        rooms: ['лаб. 2', 'лаб. 3', 'лаб. 12', 'лаб. 13']),
    Exam(subjectName: 'Дискретна математика',
        dateTime: DateTime(2025, 10, 18, 14, 0),
        rooms: ['лаб. 2', 'лаб. 3', 'лаб. 117', 'лаб. 215']),
    Exam(subjectName: 'Бизнис статистика',
        dateTime: DateTime(2025, 10, 20, 9, 0),
        rooms: ['Б1', 'Б2.2', 'Б3.2']),
    Exam(subjectName: 'Веб програмирање',
        dateTime: DateTime(2025, 11, 03, 13, 0),
        rooms: ['лаб. 117', 'лаб. 138', 'лаб. 200в']),
    Exam(subjectName: 'Структурно програмирање',
        dateTime: DateTime(2025, 11, 10, 11, 0),
        rooms: ['лаб. 138', 'лаб. 215', 'лаб. 200аб']),
    Exam(subjectName: 'Вовед во науката за податоци',
        dateTime: DateTime(2025, 11, 27, 12, 0),
        rooms: ['лаб. 117', 'лаб. 215', 'лаб. 12']),
    Exam(subjectName: 'Електронска и мобилна трговија',
        dateTime: DateTime(2025, 11, 29, 15, 0),
        rooms: ['лаб. 138', 'лаб. 117', 'лаб. 12', 'лаб. 13']),
    Exam(subjectName: 'Бази на податоци',
        dateTime: DateTime(2025, 12, 2, 10, 0),
        rooms: ['лаб. 215', 'лаб. 200аб', 'лаб. 200в', 'лаб. 117']),
    Exam(subjectName: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 12, 4, 9, 0),
        rooms: ['лаб. 215', 'лаб. 117']),
    Exam(subjectName: 'Мултимедиски мрежи',
        dateTime: DateTime(2025, 12, 6, 14, 0),
        rooms: ['лаб. 117', 'лаб. 200ц']),
    Exam(subjectName: 'Е-влада',
        dateTime: DateTime(2025, 12, 8, 14, 0),
        rooms: ['лаб. 138'])
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            'Распоред за испити - 223158',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index){
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.deepPurple[100],
            padding: const EdgeInsets.all(12),
            child: Text(
              'Вкупен број на испити: ${exams.length}',
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Question {
  final int questionNumber;
  final String question;
  final List<String> options;
  // final String correctAnswer;

  Question({
    required this.questionNumber,
    required this.question,
    required this.options,
    // required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionNumber: json['questionNumber'],
        question: json['question'],
        options: List<String>.from(json['options']),
        // correctAnswer: json['correctAnswer'],
      );
}


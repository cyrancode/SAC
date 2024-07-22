// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/controllers/constatController.dart';
import 'package:sac/models/questions_model.dart';
import 'package:sac/pages/navDrawer.dart';
import 'package:sac/pages/observations.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<dynamic> jsonData = [
    {
      "questionNumber": 1,
      "question": "Where did the accident occur?",
      "options": ["Intersection", "Highway", "Residential Area", "Parking lot"],
    },
    {
      "questionNumber": 2,
      "question": "What time did the accident occur?",
      "options": ["Morning", "Afternoon", "Evening", "Night"],
    },
    {
      "questionNumber": 3,
      "question":
          "What were the weather conditions at the time of the accident",
      "options": ["Sunny", "Rainy", "Foggy", "Snowy", "Clear"],
    },
    {
      "questionNumber": 4,
      "question": "Describe the road conditions:",
      "options": ['Wet', 'Dry', 'Icy', 'Gravel', 'Uneven'],
    },
    {
      "questionNumber": 5,
      "question": "Estimate the speed of your vehicle at the time of impact: ",
      "options": ['Less than 10 mph', '10-30 mph', '30-50 mph', 'Over 50 mph'],
    },
    {
      "questionNumber": 6,
      "question":
          "Estimate the distance between your vehicle and the other vehicle at the time of impact:",
      "options": [
        'Less than 1 meter',
        '1-5 meters',
        '5-10 meters',
        'Over 10 meters'
      ],
    },
    {
      "questionNumber": 7,
      "question": "What action were you performing just before the accident? ",
      "options": [
        'Accelerating',
        'Braking',
        'Changing lanes',
        'Turning',
        'Stopped'
      ],
    },
    {
      "questionNumber": 8,
      "question": "Were traffic signals or signs involved in the accident?",
      "options": ['Yes', 'No', 'Not applicable'],
    },
    {
      "questionNumber": 9,
      "question": "Were there any witnesses to the accident?",
      "options": ['Yes, multiple', 'Yes, one', 'No'],
    },
    {
      "questionNumber": 10,
      "question": "What are the number of veihceles involved?",
      "options": ['One', 'Two', 'More than two'],
    },
  ];

  final ConstatController constatController = Get.put(ConstatController());
  List<Question> questions = [];
  // Map<int, String> answers = {};
  var answers = {};

  void _handleRadioValueChanged(
      String value, String questionText, int questionNumber) {
    // setState(() => answers[questionNumber] = value);
    setState(() {
      answers[questionText] = value;
      // answers[questionText] = questionText;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool checkUser = false;
  @override
  void initState() {
    super.initState();
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      checkUser = true;
    } else {
      checkUser = false;
    }
    questions = jsonData.map((json) => Question.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: checkUser
            ? null // Remove leading when drawer is shown (if checkUser is true)
            : IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
        title: Text(
          "SAC: Questionnaire",
        ),

        // backgroundColor: Colors.white,
      ),
      drawer: checkUser ? NavDrawer() : null,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  Question question = questions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${question.questionNumber}: ${question.question}',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: question.options.map((option) {
                            return RadioListTile(
                              title: Text(option),
                              value: option,
                              groupValue: answers[question.question],
                              onChanged: (value) {
                                _handleRadioValueChanged(value.toString(),
                                    question.question, question.questionNumber);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                _submitAnswers();
                Get.to(() => AdditionalObservations());
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Suivant',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.skip_next, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  void _submitAnswers() {
    // Printing out chosen answers alongside question numbers
    print("Submitted Answers:");
    answers.forEach((questionText, answer) {
      // print("Question $questionText: $answer");
      var questionInfo = {'question': questionText, 'answer': answer};
      print(questionInfo);

      constatController.questionionaire.add(questionInfo);
    });
  }
}

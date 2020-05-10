import 'package:flutter/material.dart';

class QuestionAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questions:",
          style: TextStyle(color: Colors.blueGrey),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
      QuestionStepperClass(),
    );
  }
}

class QuestionStepperClass extends StatefulWidget {

  @override
  _QuestionStepperClassState createState() => _QuestionStepperClassState();
}

class _QuestionStepperClassState extends State<QuestionStepperClass> {
      int _currentStep = 0;

@override
Widget build(BuildContext context) {
  return Stepper(
    currentStep: _currentStep,
    onStepContinue: () {
      if (_currentStep >= 4) return;
      setState(() {
        _currentStep += 1;
      });
    },
    onStepCancel: () {
      if (_currentStep <= 0) return;
      setState(() {
        _currentStep -= 1;
      });
    },
    steps: const <Step>[
      Step(
        title: Text('Step 1'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 2'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 3'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 4'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
      Step(
        title: Text('Step 5'),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
        ),
      ),
    ],
  );
}
}

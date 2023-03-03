import 'package:flutter/material.dart';
import 'package:testingflutter/components/bottom_button.dart';
import 'package:testingflutter/constants.dart';
import 'package:testingflutter/components/reusable_card.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {


  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
                'BMI CALCULATOR'
            ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                    'Your result',
                    style: kTitleTextStyle,
                ),
              )
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                          resultText.toUpperCase(),
                          style: kResultTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        bmiResult.toUpperCase(),
                        style: kBmiTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        interpretation.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
           ),
          BottomButton(
              buttonTittle: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
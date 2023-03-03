import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testingflutter/components/reusable_card.dart';
import 'package:testingflutter/screens/results_page.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/bottom_button.dart';
import 'package:testingflutter/calculator_brain.dart';

enum Gender {
  male,
  female
}


class InputPage extends StatefulWidget {
  const InputPage({super.key});


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

    Gender? selectedGender;
    int height = 180;
    int weight = 60;
    int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('BMI CALCULATOR')
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children:  [
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                  child:ReusableCard(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: const IconContent(
                      icon:FontAwesomeIcons.venus,
                      label: "FEMALE",),
                  ),
              ),

            ],
          )
          ),
          Expanded(child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('HEIGHT',
                style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),

                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: const Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    overlayColor: const Color(0x29EB1555)
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                      }),
                )
              ],
            ),
            )
          ),
            Expanded(child:  Row(
              children:  [
               Expanded(child: ReusableCard(
                 colour: kActiveCardColour,
                 cardChild: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                        const Text('WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                   ],
                 ),
               )
              ),
                Expanded(child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                ),

            ],
          )
          ),
          BottomButton(
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation())
                ),
              );
            },
            buttonTittle: 'CALCULATE',
          )
        ],
      )
    );
  }
}


class RoundIcon extends StatelessWidget{
  const RoundIcon({super.key, this.icon, this.onPressed});

  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      elevation: 6.0,
      child: Icon(icon),
    );
  }
}


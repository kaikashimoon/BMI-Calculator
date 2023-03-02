import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testingflutter/reusable_card.dart';
import 'constants.dart';
import 'icon_content.dart';

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
                Text('HEIGHT',
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
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),

                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555)
                  ),
                  child: Slider(
                      value: height?.toDouble() ?? 0,
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
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
              children: const [
               Expanded(child: ReusableCard(
                 colour: kActiveCardColour
               )
              ),
                Expanded(child: ReusableCard(
                  colour: kActiveCardColour
                )
              )
            ],
          )
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testingflutter/reusable_card.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

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

  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColor(Gender selectedGender) {
    // male was pressed
    if (selectedGender ==  Gender.male) {
      if (maleCardColour == inactiveCardColour) {
          setState(() {
            maleCardColour = activeCardColour;
          });
      } else {
          setState(() {
            maleCardColour = inactiveCardColour;
          });
       }
    }
    if (selectedGender ==  Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
            setState(() {
              femaleCardColour = activeCardColour;
            });
      } else {
          setState(() {
            femaleCardColour = inactiveCardColour;
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('BMI CALCULATOR')
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children:  [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                        print('maleee');
                      setState(() {
                        updateColor(Gender.male);
                      });
                  },
                  child: ReusableCard(
                    colour: maleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                  child:GestureDetector(
                    onTap: (){
                              
                      print('female');
                        setState(() {
                          
                          updateColor(Gender.female);
                        });

                    },
                    child:ReusableCard(
                      colour:femaleCardColour,
                      cardChild:
                      IconContent(
                        icon:FontAwesomeIcons.venus,
                        label: "FEMALE",),
                    ),
                  ),
              ),

            ],
          )
          ),
          const Expanded(child: ReusableCard(
            colour: activeCardColour
            )
          ),

            Expanded(child:  Row(
              children: const [
               Expanded(child: ReusableCard(
                 colour: activeCardColour
               )
              ),
                Expanded(child: ReusableCard(
                  colour: activeCardColour
                )
              )
            ],
          )
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}


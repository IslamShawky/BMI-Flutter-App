import 'BMI_Calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'NewCardWidget.dart';
import 'GenderSelectWidget.dart';
import 'constants.dart';
import 'CircularIcon.dart';
import 'BottomButton.dart';
import 'result_page.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selected;
  double height = 110;
  double weight = 60;
  double age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NewCardWidget(
                      cardOnTap: () {
                        setState(() {
                          selected = GenderType.male;
                        });
                      },
                      color: selected == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderSelectWidget(
                        gender: 'Male',
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: NewCardWidget(
                      cardOnTap: () {
                        setState(() {
                          selected = GenderType.female;
                        });
                      },
                      color: selected == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderSelectWidget(
                        gender: 'FEMALE',
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: NewCardWidget(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumbersTextStyle,
                          ),
                          Text(
                            'cm',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xff797a89),
                            thumbColor: Color(0xffe83d66),
                            overlayColor: Color(0x18e83d66),
                            overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 26),
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 14)),
                        child: Slider(
                          value: height,
                          min: 100,
                          max: 220,
                          divisions: 120,
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NewCardWidget(
                      color: kActiveCardColor,
                      cardChild: Column(
                        children: [
                          Text('WEIGHT', style: kLabelTextStyle),
                          Text(weight.toString(), style: kNumbersTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(width: 15),
                              CircularButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: NewCardWidget(
                          cardChild: Column(
                            children: [
                              Text('AGE', style: kLabelTextStyle),
                              Text(age.toString(), style: kNumbersTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      }),
                                  SizedBox(width: 15),
                                  CircularButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                          color: kActiveCardColor)),
                ],
              ),
            ),
            BottomButton('CALCULATE', () {
              BMI_Calculator calc = BMI_Calculator(cheight: height,cweight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Result_Page(
                  bmiValue: calc.calculateBMI(),
                  result: calc.getResult(),
                  resultAdvise: calc.getAdvise(),
                )),
              );
            })
          ],
        ),
      ),
    );
  }
}

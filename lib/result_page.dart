import 'BottomButton.dart';
import 'NewCardWidget.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class Result_Page extends StatelessWidget {

  Result_Page({@required this.bmiValue,@required this.result, @required this.resultAdvise});

  String bmiValue;
  String result;
  String resultAdvise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text('YOUR RESULT',style: kTitleTextStyle)),
            Expanded(child: NewCardWidget(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiValue,style: kNumbersTextStyle,),
                  Text(resultAdvise,style: kBodyTextStyle,textAlign: TextAlign.center,),
                ],
              ),
            ),),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.only(top: 10),
              color: kButtonContainerColor,
              child: BottomButton(
                'RE_CALCULATE',
                    (){Navigator.pop(context);},
              ),

            ),
          ],
        ),
      ),
    );
  }
}
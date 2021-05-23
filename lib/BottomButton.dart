import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton(@required this.text,this.onPress);
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kButtonContainerHeight,
        margin: EdgeInsets.only(top: 10),
        color: kButtonContainerColor,
        child: Center(child: Text(text,
          style:kButtonContainerTextStyle,),),
      ),
      onPressed: onPress,
    );
  }
}


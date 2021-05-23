import 'package:flutter/material.dart';
import 'constants.dart';

class CircularButton extends StatelessWidget {
  CircularButton({@required this.icon, @required this.onPressed});
  IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onPressed,
      shape: CircleBorder(),
      fillColor: kInactiveCardColor,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),

    );
  }
}

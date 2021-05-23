import 'package:flutter/material.dart';

class NewCardWidget extends StatelessWidget {
  NewCardWidget({@required this.color, this.cardChild, this.cardOnTap});
  final Color color;
  final Widget cardChild;
  final Function cardOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardOnTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

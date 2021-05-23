import 'package:flutter/material.dart';
import 'constants.dart';


class GenderSelectWidget extends StatelessWidget {
  GenderSelectWidget({@required this.gender, @required this.genderIcon});
  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
